//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CapaDatos
{
    using System;
    using System.Collections.Generic;
    
    public partial class Factor
    {
        public Factor()
        {
            this.Gerente = new HashSet<Gerente>();
            this.Proyecto = new HashSet<Proyecto>();
            this.Valor = new HashSet<Valor>();
        }
    
        public int ID { get; set; }
        public string Nombre { get; set; }
    
        public virtual ICollection<Gerente> Gerente { get; set; }
        public virtual ICollection<Proyecto> Proyecto { get; set; }
        public virtual Ponderacion Ponderacion { get; set; }
        public virtual ICollection<Valor> Valor { get; set; }
    }
}
