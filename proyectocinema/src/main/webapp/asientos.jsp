<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="modelo.Sala" %>
<%@ page import="modelo.Asiento" %>

<%
    Sala sala = (Sala)request.getAttribute("sala");
    Asiento[][] asientos = sala.getAsientos();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Selección de Asientos</title>
    <style>
        .disponible {
            background-color: green;
            cursor: pointer;
        }

        .ocupado {
            background-color: red;
        }

        td {
            width: 30px;
            height: 30px;
            text-align: center;
            vertical-align: middle;
            border: 1px solid black;
        }

        table {
            border-collapse: collapse;
        }
    </style>
    <script>
        function seleccionarAsiento(fila, columna) {
            alert("Asiento seleccionado: Fila " + fila + ", Columna " + columna);
        }
    </script>
</head>
<body>

<h2>Seleccione su Asiento</h2>

<table>
    <% for (int fila = 0; fila < asientos.length; fila++) { %>
    <tr>
        <% for (int columna = 0; columna < asientos[fila].length; columna++) {
            Asiento asiento = asientos[fila][columna];
        %>
        <td class="<%= asiento.isOcupado() ? "ocupado" : "disponible" %>"
            onclick="<%= !asiento.isOcupado() ? "seleccionarAsiento(" + fila + ", " + columna + ")" : "" %>">
            <%= fila + 1 %>,<%= columna + 1 %>
        </td>
        <% } %>
    </tr>
    <% } %>
</table>

</body>
</html>
