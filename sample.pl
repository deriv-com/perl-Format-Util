use Syntax::Keyword::Try;
use Math::Round;
# Tuning the default half value - Check the documentations
$Math::Round::half = 0.50000000008;
use Carp 'cluck';

# warn user (from perspective of caller)

sub roundcommon {
    my ($precision, $val) = @_;

    try {
        my $decimal_points = log(1 / $precision) / log(10);
        $format = "%." . $decimal_points . "f";                   # "%.2f" for 0.01 pip_size
        my $rounded = nearest($precision, $val);                  # Round to infinity
        return sprintf($format, $rounded == 0 ? 0 : $rounded);    # Avoid negative zero
    } catch ($e) {
        cluck "Error occurred when rounding $val with $precision";
    }
}

print STDERR "Round: " . roundcommon(0, 150.9065) . "\n";

