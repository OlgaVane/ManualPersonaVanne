using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UTTT.Ejemplo.Linq.Data.Entity;

namespace UTTT.Ejemplo.Persona.Modelo
{
    public class ClsLogin
    {
        public static int Sessiones(string usuario, string password)
        {
            DcGeneralDataContext dcGlobal = new DcGeneralDataContext();
            int idUsuario = 0;
            var query = dcGlobal.Usuario.Where(p => p.strNombreUsuario == usuario && p.strContraseña == password).Select(p => p);
            var query1 = from p in dcGlobal.Usuario
                         where p.strNombreUsuario == usuario && p.strContraseña == password
                         select p;
            if (query.Count() > 0)
                idUsuario = query.First().id;
            return idUsuario;
        }
    }
}