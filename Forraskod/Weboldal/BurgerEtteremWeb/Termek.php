<?php
    class Termek
    {
        public $id,$nev,$ar,$leiras,$aktiv;

        function __construct($id,$nev,$ar,$leiras,$aktiv)
        {
            $this->id = $id;
            $this->nev = $nev;
            $this->ar = $ar;
            $this->leiras = $leiras;
            $this->aktiv = $aktiv;
        }
    }
?>