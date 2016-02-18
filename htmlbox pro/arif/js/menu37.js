 var menu37 = new Menu(null);
        var node = document.getElementById("foto1").getElementsByTagName("a");
        //mengambil link sebagai id
       for (i = 0; i < node.length; i++) {
           console.log(i);
           var padd = node[i].parentNode.style.paddingLeft;
           var id = node[i].getAttribute("href").match(/\d+/)[0];
           
           if(padd==="8px"){
           eval("var menu"+id+" = new Menu(menu37,node[i].parentNode.parentNode)");
           }
           if(padd==="40px"){
           eval("var menu"+id+" = new Menu(menu37.child[menu37.child.length - 1],node[i].parentNode.parentNode)");
           }
           if(padd==="80px"){
           eval("var menu"+id+" = new Menu(menu37.child[menu37.child.length - 1].child[menu37.child[menu37.child.length - 1].child.length - 1],node[i].parentNode.parentNode)");
           }
           }
           console.log(node);
