# Get all nodes involved in a relationship called "Married"
()-[:MARRIED]->()

# Get all actors married to dancers
(:Actor)-[:MARRIED]->(:Dancer)

# Get all actors called "Nino Rossi" married to dancers
(:Actor {name: 'Nino Rossi'})-[:MARRIED]->(:Dancer)

# Get a directionless relationship
MATCH
(:Person)-[:IS_RELATIVE]-(p:Person)
RETURN p

# Get two nodes connected in some way directionally (no matter what kind relationship)
MATCH
(:Person)-->(p:Person)
RETURN p

# Get two nodes connected in some way directionally through another node (no matter what relationship)
MATCH
(:Actor)-[]->()-[]->(p:Person)
RETURN p

# Get all the nodes specified which have distance of two hops
MATCH
(:Actor)-[*2]->(p:Planet)
RETURN p

# Get all the character nodes specified which have distance of one or two hops using the COMPANION_OF relationship (directionless)
MATCH
(c:Character)-[:COMPANION_OF*1..2]-(:Character)
RETURN c

# Get all actors called "Nino Rossi" married to russian dancers
(:Actor {name: 'Nino Rossi'})-[:MARRIED]->(:Dancer)-[:COMES_FROM]->(:Country{name:'Russia'})

# Retrieve only characters which have been played by Matt Smith
MATCH
(:Actor {name:'Matt Smith'})-[:PLAYED]->(c:Character)
RETURN c

# Retrieve only certain properties of nodes
# Note that with others, we are just creating a variable and not specifying the constraint
# on the type of node
MATCH
(actors:Actor)-[:MARRIED]->(others)
RETURN actors.name, others.name

# Collect all Character nodes which are enemy of "Doctor" and come from a planet
# Return the planet name and the count
MATCH
(:Character {name:"Doctor"})<-[:ENEMY_OF]-(:Character)-[:COMES_FROM]->(p:Planet)
RETURN p.name as Planet, count(p) AS Count

# Get all episodes in which character "Amy Pond" and actor "Matt Smith" were in
# List the enemies of the Doctor that were in that episode
MATCH
(:Actor{name:'Matt Smith'})-[:APPEARED_IN]->(ep:Episode)<-[:APPEARED_IN]-(:Character{name:'Amy Pond'}),
(ep)<-[:APPEARED_IN]-(enemies:Character)<-[:ENEMY_OF]-(:Character{name:'Doctor'})
RETURN ep AS Episode, collect(enemies.name) AS Enemies;

# Apply filter with WHERE (this is equivalent to using {} within node specification)
MATCH
(:Actor)-[:PLAYED]->(c:Character)
WHERE a.name = 'Matt Smith'
RETURN c

# Sort results
MATCH
(a:Actor)-[:PLAYED]->(c:Character)
WHERE a.name = 'Matt Smith'
RETURN c
ORDER BY c.name

# Sort results by more properties
MATCH
(a:Actor)-[:PLAYED]->(c:Character)
WHERE a.name = 'Matt Smith'
RETURN c
ORDER BY c.name, c.sallary

# Sort results in descending order
MATCH
(a:Actor)-[:PLAYED]->(c:Character)
WHERE a.name = 'Matt Smith'
RETURN c
ORDER BY c.name DESC

# Get at maximum 10 results but skip the first 5 (6->15)
MATCH
(a:Actor)-[:PLAYED]->(c:Character)
RETURN c
LIMIT 10
SKIP 5

# Union between more queries
MATCH (a:Actor)
RETURN a.name
UNION
MATCH (c:Character)
RETURN c.name

# Union between more queries (keep duplicates)
MATCH (a:Actor)
RETURN a.name
UNION ALL
MATCH (c:Character)
RETURN c.name

## Predicates
# These are commands which either return True or False and are:
# ALL, ANY, NONE, SINGLE, EXISTS
# These are generally used with WHERE clauses

# Where Exists example
MATCH
(a:Actor)
WHERE EXISTS ((a)-[:PLAYED]->())
RETURN a.name


## Scalar Functions
# These are commands which return a single value (scalar)
# Common scalar functions are:
# LENGTH, TYPE, ID, COALESCE, HEAD, LAST, TIMESTAMP, TOINT, TOFLOAT, TOSTRING

# Get the number of times a pattern exists in the database
MATCH
p = (:Actor)-[:PLAYED]->(:Character)
RETURN LENGTH(p)

## Collection Functions
# These are commands which return a collection of some type
# Example collection functions are:
# NODES, RELATIONSHIPS, LABELS, EXTRACT, FILTER, TAIL, RANGE, REDUCE

# Get all nodes involved in the specified pattern
MATCH
p = (:Actor)-[:PLAYED]->(:Character)
RETURN NODES(p)

# Get Shortest Path between two nodes with a maximum of 15 hops
MATCH
(earth:Planet{name:"Earth"}),
(gallifrey:Planet{name:"Gallifrey"}),
p = SHORTESTPATH( 
    (earth)-[*..15]-(gallifrey)
    )
RETURN p


# Create an anonymous node
CREATE(n)

# Create a labeled node and show it immediately
CREATE(n:Actor{name:'Jack Black'})
RETURN n

# Create a relationship between two nodes
MATCH
(matt:Actor{name:'Matt Smith'}),
(jack:Actor{name:'Jack Black'})
CREATE (matt) [:COMPANION_OF] (jack)

# Create a pattern (two nodes + relationship)
CREATE
p = (:Actor{name:'Jack Black'})-[:APPEARED_IN]->(:Episode{name:'The truth lies behind'})
RETURN p


# Delete node
MATCH
(matt:Actor{name:'Matt Smith'})
DELETE matt

# Delete node and all (inbound, outbound) relationships with other nodes
MATCH
(matt:Actor{name:'Matt Smith'})-[r]-()
DELETE matt,r

# Modify node properties (this updates or adds in case of non-existing)
MATCH
(matt:Actor{name:'Matt Smith'})
SET matt.salary = 10000, matt.active = true

# Delete node properties 
MATCH
(matt:Actor{name:'Matt Smith'})
SET matt.salary = NULL

# Copy Node properties to another node
MATCH
(matt:Actor{name:'Matt Smith'}),
chris:Actor{name:'Christopher Nolan'}
SET matt = chris

# Add a label to a node
MATCH
(matt:Actor{name:'Matt Smith'})
SET matt:Doctor

# Remove a property or a label to a node (equivalent to set the property to NULL)
MATCH
(matt:Actor{name:'Matt Smith'})
REMOVE matt:Doctor

# Set a property to a list of nodes matching a condition
MATCH
p = (actors:Actor)-[r:PLAYED]->others)
WHERE actors.saslary > 1000
FOREACH (n IN nodes(p)| set n.done = true)


# Create an index on a property (it makes retrievals faster)
CREATE INDEX ON :Actor(name)

# Remove an index
DROP INDEX ON :Actor(name)

# Create a unique constraint (makes things a little bit slower)
CREATE CONSTRAINT ON (a:Actor)
ASSERT a.name IS UNIQUE

# Remove a unique constraint
DROP CONSTRAINT ON (a:Actor)
ASSERT a.name IS UNIQUE


# Import CSV
## Import a persons dataset
LOAD CSV WITH HEADERS FROM
"http://docs.neo4j.org/chunked/2.1.6/csv/import/persons.csv"
AS csvLine

CREATE
(p:Person
    {id: toInt(csvLine.id),
     name: csvLine.name})

## Import a movies dataset
LOAD CSV WITH HEADERS FROM
"http://docs.neo4j.org/chunked/2.1.6/csv/import/movies.csv"
AS csvLine
MERGE (country: Country {name: csvLine:country})  # this will create only if it doesn't exist

CREATE
(m:Movie
    {id: toInt(csvLine.id),
     title: csvLine.title})
CREATE (movie)-[:MADE_IN]->(country)


## Import a dataset describing relationships between movies and persons
LOAD CSV WITH HEADERS FROM
"http://docs.neo4j.org/chunked/2.1.6/csv/import/roles.csv"
AS csvLine
MATCH
(actor:Person {id: toInt(csvLine.personId)}),
(movie:Movie  {id: toInt(csvLine.movienId)}),

CREATE (actor)-[:PLAYED {role:csvLine.role}]->(movie) # here the role is a property of the relationship

