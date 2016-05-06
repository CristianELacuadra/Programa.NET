using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CapaDatos;
namespace Prueba
{
    class Consultas
    {
        public ADDFACTOR(FactorDTO AddFac)
        {
            try
            {
                using (ModeloDatosContainer DBContexto = new ModeloDatosContainer())
                {
                    Factor Entidad = new Factor();
                    Entidad.Nombre = AddFac.Nombre;
                    DBContexto.Factor.Add(Entidad);
                }
            }
            catch(Exception Ex)
            {

            }
         }
    }
}
