const permutation = (n, r) => {
    let n_fac = factorial(n);
    let nminusr_fac = factorial(n - r);

    return n_fac / nminusr_fac;
};

const combination = (n, r) => {
    let n_fac = factorial(n);
    let nminusr_fac = factorial(n - r);
    let r_fac = factorial(r);

    return n_fac / (nminusr_fac * r_fac);
};

const multiPermutation = (n, r) => {
    return power(n, r);
};

const multiCombination = (n, r) => {
    return combination(n + r - 1, r);
};

function factorial(x) 
{
    let x_fac = 1;

    for(; x > 0; x--)
    {
        x_fac *= x;
    }

    return x_fac;
}

function power(n, r)
{
    let val = 1;

    for(; r > 0; r--)
    {
        val *= n;
    }

    return val;
}

module.exports = {
    permutation,
    combination,
    multiCombination,
    multiPermutation,
}