package DoTS::Gene::ConfidenceScore::ESTPlotScore;

use strict;
use DoTS::Gene::ESTOrientationRecord;
use DoTS::Gene::ESTOrientationPlot;

1;

=item setESTPlotScore:

set EST plot (5' ends of 5' ESTs and 3' ends of 3' ESTs) score for given gDG

=cut

sub setESTPlotScore {
  my ($dbh, $gdg_tab, $gdt_tab, $gid, $cs_info, $debug) = @_;

  my $args = { gdg_tab => $gdg_tab, gdt_tab => $gdt_tab, type => 'dg', id => $gid, debug => $debug };
  my $record = Dots::Gene::ESTOrientationRecord->new($args);
  $args = { record => $record, bincount => 10, debug => $debug };
  print "getting plot for dg/gdg.$gid ...\n" if $debug;
  my $plot = Dots::Gene::ESTOrientationPlot->new($args);

  my $score = $plot->getScore;
  if ($debug) {
    $args = { graph => 1 };
    print "printing plot for dg/ag.$gid ...\n";
    $plot->printPlot($args);
  }

  $cs_info->{est_plot_score} = ($score ? $score : 0);
}
