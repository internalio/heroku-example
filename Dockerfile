FROM internalio/onprem:2.0.0

ADD entrypoint.sh /usr/local/bin/entrypoint
ADD release.sh /usr/local/bin/release

CMD ["/usr/local/bin/entrypoint"]
