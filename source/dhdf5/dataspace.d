module dhdf5.dataspace;

import hdf5.hdf5;

struct DataSpace
{
    this(int rank, hsize_t[] dim)
    {
        _space = H5Screate_simple(rank, dim.ptr, null);
        assert(_space >= 0);
    }

    ~this()
    {
        H5Sclose(_space);
    }

    auto tid() const pure @safe @nogc
    {
    	return _space;
    }

private:
    hid_t _space;
}
