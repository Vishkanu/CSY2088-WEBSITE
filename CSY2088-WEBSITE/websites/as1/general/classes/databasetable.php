<?php
namespace general\classes;

class DatabaseTable
{
    private $table;
    private $pdo;
    private $primarykey;

    public function __construct($pdo, $table, $primarykey)
    {
        $this->pdo = $pdo;
        $this->table = $table;
        $this->primarykey = $primarykey;
    }

    public function find($field, $value)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM ' . $this->table . ' WHERE ' . $field . ' = :value');
        $criteria = ['value' => $value];
        $stmt->execute($criteria);
        return $stmt->fetchAll();
    }
    public function columnFind($column)
    {
        $stmt = $this->pdo->prepare('SELECT ' . $column . ' FROM ' . $this->table);
        $stmt->execute();
        return $stmt->fetchAll();
    }
    public function update($record)
    {
        $query = 'UPDATE ' . $this->table . ' SET ';

        $parameters = [];

        foreach ($record as $key => $value) {
            $parameters[] = $key . '= :' . $key;
        }

        $query .= implode(',', $parameters);
        $query .= ' WHERE ' . $this->primarykey . ' = :primarykey';

        $record['primarykey'] = $record[$this->primarykey];
        
        $stmt = $this->pdo->prepare($query);

        $stmt->execute($record);

    }

    public function findAll()
    {
        $stmt = $this->pdo->prepare('SELECT * FROM ' . $this->table);
        $stmt->execute();
        return $stmt->fetchAll();
    }

    public function insert($record)
    {
        $keys = array_keys($record);

        $values = implode(', ', $keys);
        $valuesWithColon = implode(', :', $keys);

        $query = 'INSERT INTO ' . $this->table . ' (' . $values . ') VALUES (:' . $valuesWithColon . ')';

        $stmt = $this->pdo->prepare($query);

        $stmt->execute($record);
    }

    public function save($record)
    {
        // Check if the primary key exists in the record data
        if (empty($record[$this->primarykey])) {
            $this->insert($record);
        } else {
            $this->update($record);
        }

    }
    public function delete($record)
    {
        $query = 'DELETE FROM ' . $this->table . ' WHERE ' . $record;

        $stmt = $this->pdo->prepare($query);
        $stmt->execute();
    }
}