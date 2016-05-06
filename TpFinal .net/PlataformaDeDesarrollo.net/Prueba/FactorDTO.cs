using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Prueba
{
    public class FactorDTO
    {
        int _ID;
        string _Nombre;
        public int ID
        {
            get { return _ID; }
        }
        public String Nombre
        {
            get { return _Nombre; }
            set { _Nombre = value; }
        }
    }
}
