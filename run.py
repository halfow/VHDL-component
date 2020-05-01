from vunit import VUnit
from os.path import join, dirname

vu = VUnit.from_argv()

# Set Library and Add Files 
testlib = vu.add_library("testlib")
testlib.add_source_files(join(dirname(__file__), "*", "*.vhd"))
[testlib.test_bench("tb_tb").test("pass_test").add_config(f"conf{n}") for n in range(3)]

# Add Testcase do files (test/wave/[test name].do)
# TODO: Add outer loop for libraries to make fully generic. 
# Note: Tailor naming scheme to fit your needs
for tb in testlib.get_test_benches():
    for test in tb.get_tests():
        naming_scheme = join("test", "wave", test.name + ".do")
        test.set_sim_option("modelsim.init_file.gui", naming_scheme)

vu.main()