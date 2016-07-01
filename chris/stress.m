function toReturn = stress(nnodes, nelems, nmatls, ...
    inode, jnode, knode, x, y, sigxx, sigyy, sigzz, ...
    tauxy, displx, disply, sig1, sig2, sig3, taumax, ...
    e, pr, matl, type)
    for i = 1:nelems
        sigxx(i) = 0.0;
        sigyy(i) = 0.0;
        sigzz(i) = 0.0;
        tauxy(i) = 0.0;
    end
    i=1;
    while i < nelems && i < 100
        displ(1, 1) = displx(inode(i);
        displ(2, 1) = disply(inode(num));
        displ(3, 1) = displx(jnode(num));
        displ(4, 1) = disply(jnode(num));
        displ(5, 1) = displx(knode(num));
        displ(6, 1) = disply(knode(num));
        i = i + 1;
        
        xlocal(1)=x(inode(num));
        xlocal(2)=x(jnode(num));
        xlocal(3)=x(knode(num));
        ylocal(1)=y(inode(num));
        ylocal(2)=y(jnode(num));
        ylocal(3)=y(knode(num));
        xbar=(xlocal(1)+xlocal(2)+xlocal(3))/3.0;
        ybar=(ylocal(1)+ylocal(2)+ylocal(3))/3.0;
        for a = 1:3
            xlocal(a) = xlocal(a) - xbar;
            ylocal(a) = ylocal(a) - ybar;
        end
    end
end