<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Test Page</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>


<table class="dowolna_nazwa">
    <thead >
        <tr id="tdh">
            <th>-</th>
        </tr>
    </thead>
    <tbody id="tbd">
    </tbody>
</table>

<p align="center">Numer: <input type="number" id="liczba"></p>
<p align="center"><button id="myBtn">D o d a j</button></p>
<p align="center"><button id="test">test</button></p>
<hr>

<script>





    document.getElementById('test').onclick = testF



    function testF(){
        var tds = document.getElementsByTagName("td")
        var trs = document.getElementsByTagName("tr")
        var res = ''
        for (let i = 0; i < tds.length; i++) {
            res += tds[i].innerHTML + " "
        }

        console.log(res)


        $.ajax({
            type: "get",
            url: "http://localhost:8080/addCompetence",
            data: {'res': res, 'count': trs.length},
            success: function(msg){
                alert( "Прибыли данные: " + msg );
            }
        });

    }

    var numbers2 = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [9, 0, 1]];



    document.addEventListener("DOMContentLoaded", () => {

        for (let i = 0; i < numbers2.length; i++) { // выведет 0, затем 1, затем 2
            var wiersz1 = document.createElement("tr");
            for (let j = 0; j < numbers2[i].length; j++) { // выведет 0, затем 1, затем 2
                var tdNumer = document.createElement("td");
                var val = numbers2[i][j]
                tdNumer.innerHTML = val
                wiersz1.appendChild(tdNumer);
            }
            var dodac1 = document.getElementById("tbd");
            dodac1.appendChild(wiersz1);
        }
    });

    document.getElementById("myBtn").onclick = dodajWiersz;

    function dodajWiersz() {
        var wiersz1 = document.createElement("tr");
        var tdNumer = document.createElement("td");
        var thNumer = document.createElement("th");
        var val1 = document.getElementById("liczba").value;
        tdNumer.innerHTML = val1;
        thNumer.innerHTML = val1;

        wiersz1.appendChild(tdNumer);
        wiersz1.appendChild(thNumer);

        var dodac1 = document.getElementById("tbd");
        var dodac2 = document.getElementById("tdh");
        dodac1.appendChild(wiersz1);
        dodac2.appendChild(thNumer);

        var trss = document.getElementsByTagName("tr")
        for (let i = 1; i < trss.length; i++) {
            var tdNumer = document.createElement("td");
            tdNumer.innerHTML = 0;
            trss[i].appendChild(tdNumer)
            dodac1.appendChild(trss[i])
        }
        console.log(trss.length)

    }
</script>


</body>
</html>