package Job::Machine;

our $VERSION = "0.01";

1;
__END__
=pod

=head1 NAME

Job::Machine - Job queue handling

=head1 SYNOPSIS

The Client:

  my $client = Job::Machine::Client->new(jobclass => 'job.task');
  $client->id(42);
  $client->send({foo => 'bar'});

The Worker is a subclass

  use base 'Job::Machine::Worker';

  sub process {
      my ($self, $data) = @_;
      $self->reply({baz => 'Yeah!'}) if $data->{foo} eq 'bar';
  };

and then use the worker

  my $worker = Worker->new(jobclass => 'job.task');
  $worker->receive;

Back at the Client:

  if ($client->check('reply')) {
      print $client->receive->{baz};
  }

=head1 DESCRIPTION

A Small, efficient system for sending jobs to a message queue and 
communicating answers back to the sender.

=head1 SUPPORT

No support is available

=head1 AUTHOR

Kaare Rasmussen <kaare@cpan.org>.

=head1 COPYRIGHT

Copyright (C) 2009, Kaare Rasmussen

This module is free software; you can redistribute it or modify it
under the same terms as Perl itself.
