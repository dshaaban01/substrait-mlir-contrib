// RUN: substrait-opt -split-input-file %s \
// RUN: | FileCheck %s

// CHECK-LABEL: substrait.plan
// CHECK:         relation
// CHECK:         %[[V0:.*]] = named_table @t1 as ["a", "b"] : tuple<!substrait.timestamp, !substrait.timestamp_tz>
// CHECK-NEXT:    yield %0 : tuple<!substrait.timestamp, !substrait.timestamp_tz>
  
substrait.plan version 0 : 42 : 1 {
  relation {
    %0 = named_table @t1 as ["a", "b"] : tuple<!substrait.timestamp, !substrait.timestamp_tz>
    yield %0 : tuple<!substrait.timestamp, !substrait.timestamp_tz>
  }
}

// -----

// CHECK-LABEL: substrait.plan
// CHECK:         relation
// CHECK:         %[[V0:.*]] = named_table @t1 as ["a"] : tuple<!substrait.binary>
// CHECK-NEXT:    yield %0 : tuple<!substrait.binary>

substrait.plan version 0 : 42 : 1 {
  relation {
    %0 = named_table @t1 as ["a"] : tuple<!substrait.binary>
    yield %0 : tuple<!substrait.binary>
  }
}

// -----

// CHECK-LABEL: substrait.plan
// CHECK:         relation
// CHECK:         %[[V0:.*]] = named_table @t1 as ["a"] : tuple<!substrait.string>
// CHECK-NEXT:    yield %0 : tuple<!substrait.string>

substrait.plan version 0 : 42 : 1 {
  relation {
    %0 = named_table @t1 as ["a"] : tuple<!substrait.string>
    yield %0 : tuple<!substrait.string>
  }
}

// -----

// CHECK-LABEL: substrait.plan
// CHECK:         relation
// CHECK:         %[[V0:.*]] = named_table @t1 as ["a", "b"] : tuple<f32, f64>
// CHECK-NEXT:    yield %[[V0]] :

substrait.plan version 0 : 42 : 1 {
  relation {
    %0 = named_table @t1 as ["a", "b"] : tuple<f32, f64>
    yield %0 : tuple<f32, f64>
  }
}

// -----

// CHECK-LABEL: substrait.plan
// CHECK:         relation
// CHECK:         %[[V0:.*]] = named_table @t1 as ["a", "b", "c"] : tuple<f32, tuple<f32>>
// CHECK-NEXT:    yield %[[V0]] :

substrait.plan version 0 : 42 : 1 {
  relation {
    %0 = named_table @t1 as ["a", "b", "c"] : tuple<f32, tuple<f32>>
    yield %0 : tuple<f32, tuple<f32>>
  }
}

// -----

// CHECK-LABEL: substrait.plan
// CHECK:         relation
// CHECK:         %[[V0:.*]] = named_table @t1 as ["a", "b", "c", "d", "e"] : tuple<si1, si8, si16, si32, si64>
// CHECK-NEXT:    yield %[[V0]] :

substrait.plan version 0 : 42 : 1 {
  relation {
    %0 = named_table @t1 as ["a", "b", "c", "d", "e"] : tuple<si1, si8, si16, si32, si64>
    yield %0 : tuple<si1, si8, si16, si32, si64>
  }
}

// -----

// CHECK-LABEL: substrait.plan
// CHECK:         relation
// CHECK:         %[[V0:.*]] = named_table @t1 as ["a", "b", "c"] : tuple<si1, tuple<si1>>
// CHECK-NEXT:    yield %[[V0]] :

substrait.plan version 0 : 42 : 1 {
  relation {
    %0 = named_table @t1 as ["a", "b", "c"] : tuple<si1, tuple<si1>>
    yield %0 : tuple<si1, tuple<si1>>
  }
}