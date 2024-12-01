### SI\_SUB\_TUNABLES

#### madt\_register (sys/x86/acpica/madt.c:325)

```txt
Control Flow:
mi_startup
    ...
    madt_register <-- Here

Note: madt_enumerator is defined on lines 92-98
      of sys/x86/acpica/madt.c.
```

#### x86\_iommu\_set\_intel (sys/x86/iommu/intel\_drv.c:1330)

```txt
Control Flow:
mi_startup
    ...
    madt_register
    x86_iommu_set_intel <-- Here
```

#### mptable\_register (sys/x86/x86/mptable.c:472)

```txt
Control Flow:
mi_startup
    ...
    madt_register
    x86_iommu_set_intel
    mptable_register <-- Here
```

#### apic\_init (sys/x86/x86/local\_apic.c:1843)

```txt
Control Flow:
mi_startup
    ...
    madt_register
    x86_iommu_set_intel
    mptable_register
    apic_init <-- Here
```

#### acpi\_set\_debugging (sys/dev/acpica/acpi.c:4382)

```txt
Control Flow:
mi_startup
    ...
    madt_register
    x86_iommu_set_intel
    mptable_register
    apic_init
    acpi_set_debugging <-- Here
```

#### mp\_setmaxid (sys/kern/subr\_smp.c:142)

```txt
Control Flow:
mi_startup
    ...
    madt_register
    x86_iommu_set_intel
    mptable_register
    apic_init
    acpi_set_debugging
    mp_setmaxid <-- Here
```

#### tunable\_set\_numzones (sys/kern/kern\_malloc.c:308)

```txt
Control Flow:
mi_startup
    ...
    madt_register
    x86_iommu_set_intel
    mptable_register
    apic_init
    acpi_set_debugging
    mp_setmaxid
    tunable_set_numzones <-- Here
```

#### init\_maxsockets (sys/kern/uipc\_socket.c:733)

```txt
Control Flow:
mi_startup
    ...
    madt_register
    x86_iommu_set_intel
    mptable_register
    apic_init
    acpi_set_debugging
    mp_setmaxid
    tunable_set_numzones
    init_maxsockets <-- Here
```

#### inittimehands (sys/kern/kern\_tc.c:1974)

```txt
Control Flow:
mi_startup
    ...
    madt_register
    x86_iommu_set_intel
    mptable_register
    apic_init
    acpi_set_debugging
    mp_setmaxid
    tunable_set_numzones
    init_maxsockets
    inittimehands <-- Here
```

#### init\_scsi\_delay (sys/cam/scsi/scsi\_all.c:9383)

```txt
Control Flow:
mi_startup
    ...
    madt_register
    x86_iommu_set_intel
    mptable_register
    apic_init
    acpi_set_debugging
    mp_setmaxid
    tunable_set_numzones
    init_maxsockets
    inittimehands
    init_scsi_delay <-- Here
```

### SI\_SUB\_COPYRIGHT

#### print\_caddr\_t (sys/kern/init\_main.c:352)

```txt
Control Flow:
mi_startup
    ...
    print_caddr_t <-- Here
```

#### print\_version (sys/kern/init\_main.c:358)

```txt
Control Flow:
mi_startup
    ...
    print_caddr_t
    print_version <-- Here
```

#### cap\_rights\_sysinit (sys/kern/subr\_capability.c:101)

```txt
Control Flow:
mi_startup
    ...
    print_caddr_t
    print_version
    cap_rights_sysinit <-- Here
```

### SI\_SUB\_VM

#### vm\_stats\_init (sys/vm/vm\_meter.c:559)

```txt
Control Flow:
mi_startup
    ...
    vm_stats_init <-- Here
```

#### uma\_startup3 (sys/vm/uma\_core.c:3204

```txt
Control Flow:
mi_startup
    ...
    vm_stats_init
    uma_startup3 <-- Here
```

#### max\_ldt\_segment\_init (sys/amd64/amd64/sys\_machdep.c:82)

```txt
Control Flow:
mi_startup
    ...
    vm_stats_init
    uma_startup3
    max_ldt_segment_init <-- Here
```

#### vm\_page\_init\_cache\_zones (sys/vm/vm\_page.c:211)

```txt
Control Flow:
mi_startup
    ...
    vm_stats_init
    uma_startup3
    max_ldt_segment_init
    vm_page_init_cache_zones <-- Here
```

#### ffs\_rawread\_setup (sys/ufs/ffs/ffs\_rawread.c:83)

```txt
Control Flow:
mi_startup
    ...
    vm_stats_init
    uma_startup3
    max_ldt_segment_init
    vm_page_init_cache_zones
    ffs_rawread_setup <-- Here
```

### SI\_SUB\_COUNTER

#### pcpu\_zones\_startup (sys/kern/subr\_pcpu.c:143)

```txt
Control Flow:
mi_startup
    ...
    pcpu_zones_startup <-- Here
```

#### uma\_startup\_pcpu (sys/vm/uma\_core.c:3192)

```txt
Control Flow:
mi_startup
    ...
    pcpu_zones_startup
    uma_startup_pcpu <-- Here
```

#### cryptostats\_init (sys/opencrypto/crypto.c:231)

```txt
Control Flow:
mi_startup
    ...
    pcpu_zones_startup
    uma_startup_pcpu
    cryptostats_init <-- Here
```

### SI\_SUB\_KMEM

#### sysctl\_register\_all (sys/kern/kern\_sysctl.c:959)

```txt
Control Flow:
mi_startup
    ...
    sysctl_register_all <-- Here
```

#### vmcounter\_startup (sys/vm/vm\_meter.c:101)

```txt
Control Flow:
mi_startup
    ...
    sysctl_register_all
    vmcounter_startup <-- Here
```

#### mallocinit (sys/kern/kern\_malloc.c:1268)

```txt
Control Flow:
mi_startup
    ...
    sysctl_register_all
    vmcounter_startup
    mallocinit <-- Here
```

#### tunable\_mbinit (sys/kern/kern\_mbuf.c:153)

```txt
Control Flow:
mi_startup
    ...
    sysctl_register_all
    vmcounter_startup
    mallocinit
    tunable_mbinit <-- Here
```

#### ktr\_entries\_initializer (sys/kern/kern\_ktr.c:186)

```txt
Control Flow:
mi_startup
    ...
    sysctl_register_all
    vmcounter_startup
    mallocinit
    tunable_mbinit
    ktr_entries_initializer <-- Here
```

#### sleepinit (sys/kern/kern\_synch.c:104)

```txt
Control Flow:
mi_startup
    ...
    sysctl_register_all
    vmcounter_startup
    mallocinit
    tunable_mbinit
    ktr_entries_initializer
    sleepinit <-- Here
```

#### pmap\_bootstrap\_la57 (sys/amd64/amd64/pmap.c:2172)

```txt
Control Flow:
mi_startup
    ...
    sysctl_register_all
    vmcounter_startup
    mallocinit
    tunable_mbinit
    ktr_entries_initializer
    sleepinit
    pmap_bootstrap_la57 <-- Here
```

#### kstack\_cache\_init (sys/vm/vm\_glue.c:462)

```txt
Control Flow:
mi_startup
    ...
    sysctl_register_all
    vmcounter_startup
    mallocinit
    tunable_mbinit
    ktr_entries_initializer
    sleepinit
    pmap_bootstrap_la57
    kstack_cache_init <-- Here
```

#### vt\_update\_static (sys/dev/vt/vt\_core.c:282)

```txt
Control Flow:
mi_startup
    ...
    sysctl_register_all
    vmcounter_startup
    mallocinit
    tunable_mbinit
    ktr_entries_initializer
    sleepinit
    pmap_bootstrap_la57
    kstack_cache_init
    vt_update_static <-- Here
```

#### vt\_init\_font (sys/dev/vt/vt\_core.c:1792)

```txt
Control Flow:
mi_startup
    ...
    sysctl_register_all
    vmcounter_startup
    mallocinit
    tunable_mbinit
    ktr_entries_initializer
    sleepinit
    pmap_bootstrap_la57
    kstack_cache_init
    vt_update_static
    vt_init_font <-- Here
```

#### vid\_malloc\_init (sys/dev/fb/fb.c:103)

```txt
Control Flow:
mi_startup
    ...
    sysctl_register_all
    vmcounter_startup
    mallocinit
    tunable_mbinit
    ktr_entries_initializer
    sleepinit
    pmap_bootstrap_la57
    kstack_cache_init
    vt_update_static
    vt_init_font
    vid_malloc_init <-- Here

105: vid_malloc = TRUE;
```

#### xrefinfo\_init (sys/dev/ofw/openfirm.c:142)

```txt
Control Flow:
mi_startup
    ...
    sysctl_register_all
    vmcounter_startup
    mallocinit
    tunable_mbinit
    ktr_entries_initializer
    sleepinit
    pmap_bootstrap_la57
    kstack_cache_init
    vt_update_static
    vt_init_font
    vid_malloc_init
    xrefinfo_init <-- Here
```

#### sysctl\_register\_fdt\_oid (sys/dev/ofw/ofw\_fdt.c:125)

```txt
Control Flow:
mi_startup
    ...
    sysctl_register_all
    vmcounter_startup
    mallocinit
    tunable_mbinit
    ktr_entries_initializer
    sleepinit
    pmap_bootstrap_la57
    kstack_cache_init
    vt_update_static
    vt_init_font
    vid_malloc_init
    xrefinfo_init
    sysctl_register_fdt_oid <-- Here
```

#### scmeminit (sys/dev/syscons/syscons.c:675)

```txt
Control Flow:
mi_startup
    ...
    sysctl_register_all
    vmcounter_startup
    mallocinit
    tunable_mbinit
    ktr_entries_initializer
    sleepinit
    pmap_bootstrap_la57
    kstack_cache_init
    vt_update_static
    vt_init_font
    vid_malloc_init
    xrefinfo_init
    sysctl_register_fdt_oid
    scmeminit <-- Here
```

#### authunix\_init (sys/rpc/auth\_unix.c:111)

```txt
Control Flow:
mi_startup
    ...
    sysctl_register_all
    vmcounter_startup
    mallocinit
    tunable_mbinit
    ktr_entries_initializer
    sleepinit
    pmap_bootstrap_la57
    kstack_cache_init
    vt_update_static
    vt_init_font
    vid_malloc_init
    xrefinfo_init
    sysctl_register_fdt_oid
    scmeminit
    authunix_init <-- Here
```

#### rpc\_gss\_hashinit (sys/rpc/rpcsec\_gss/rpcsec\_gss.c:163)

```txt
Control Flow:
mi_startup
    ...
    sysctl_register_all
    vmcounter_startup
    mallocinit
    tunable_mbinit
    ktr_entries_initializer
    sleepinit
    pmap_bootstrap_la57
    kstack_cache_init
    vt_update_static
    vt_init_font
    vid_malloc_init
    xrefinfo_init
    sysctl_register_fdt_oid
    scmeminit
    authunix_init
    rpc_gss_hashinit <-- Here
```

#### authtls\_init (sys/rpc/rpcsec\_tls/auth\_tls.c:89)

```txt
Control Flow:
mi_startup
    ...
    sysctl_register_all
    vmcounter_startup
    mallocinit
    tunable_mbinit
    ktr_entries_initializer
    sleepinit
    pmap_bootstrap_la57
    kstack_cache_init
    vt_update_static
    vt_init_font
    vid_malloc_init
    xrefinfo_init
    sysctl_register_fdt_oid
    scmeminit
    authunix_init
    rpc_gss_hashinit
    authtls_init <-- Here
```

#### authnone\_init (sys/rpc/auth\_none.c:88)

```txt
Control Flow:
mi_startup
    ...
    sysctl_register_all
    vmcounter_startup
    mallocinit
    tunable_mbinit
    ktr_entries_initializer
    sleepinit
    pmap_bootstrap_la57
    kstack_cache_init
    vt_update_static
    vt_init_font
    vid_malloc_init
    xrefinfo_init
    sysctl_register_fdt_oid
    scmeminit
    authunix_init
    rpc_gss_hashinit
    authtls_init
    authnone_init <-- Here
```

#### init\_dynamic\_kenv (sys/kern/kern\_environment.c:456)

```txt
Control Flow:
mi_startup
    ...
    sysctl_register_all
    vmcounter_startup
    mallocinit
    tunable_mbinit
    ktr_entries_initializer
    sleepinit
    pmap_bootstrap_la57
    kstack_cache_init
    vt_update_static
    vt_init_font
    vid_malloc_init
    xrefinfo_init
    sysctl_register_fdt_oid
    scmeminit
    authunix_init
    rpc_gss_hashinit
    authtls_init
    authnone_init
    init_dynamic_kenv <-- Here
```

#### static\_hints\_to\_env (sys/kern/subr\_hints.c:59)

```txt
Control Flow:
mi_startup
    ...
    sysctl_register_all
    vmcounter_startup
    mallocinit
    tunable_mbinit
    ktr_entries_initializer
    sleepinit
    pmap_bootstrap_la57
    kstack_cache_init
    vt_update_static
    vt_init_font
    vid_malloc_init
    xrefinfo_init
    sysctl_register_fdt_oid
    scmeminit
    authunix_init
    rpc_gss_hashinit
    authtls_init
    authnone_init
    init_dynamic_kenv
    static_hints_to_env <-- Here
```

#### fetch\_loader\_passphrase (sys/geom/eli/g\_eli.c:153)

```txt
Control Flow:
mi_startup
    ...
    sysctl_register_all
    vmcounter_startup
    mallocinit
    tunable_mbinit
    ktr_entries_initializer
    sleepinit
    pmap_bootstrap_la57
    kstack_cache_init
    vt_update_static
    vt_init_font
    vid_malloc_init
    xrefinfo_init
    sysctl_register_fdt_oid
    scmeminit
    authunix_init
    rpc_gss_hashinit
    authtls_init
    authnone_init
    init_dynamic_kenv
    static_hints_to_env
    fetch_loader_passphrase <-- Here
```

### SI\_SUB\_HYPERVISOR

#### xen\_hvm\_sysinit (sys/x86/xen/hvm.c:407)

```txt
Control Flow:
mi_startup
    ...
    xen_hvm_sysinit <-- Here
```

#### hyperv\_init (sys/dev/hyperv/vmbus/hyperv.c:175)

```txt
Control Flow:
mi_startup
    ...
    hyperv_init <-- Here
```

### SI\_SUB\_MTX\_POOL\_DYNAMIC

#### mtx\_pool\_setup\_dynamic (sys/kern/kern\_mtxpool.c:)

```txt
Control Flow:
mi_startup
    ...
    mtx_pool_setup_dynamic <-- Here
```

### SI\_SUB\_LOCK

#### lf\_init (sys/kern/kern\_lockf.c:280)

```txt
Control Flow:
mi_startup
    ...
    lf_init <-- Here
```

#### filelistinit (sys/kern/kern\_descrip.c:5165)

```txt
Control Flow:
mi_startup
    ...
    lf_init
    filelistinit <-- Here
```

#### nlm\_client\_init (sys/nlm/nlm\_advlock.c:96)

```txt
Control Flow:
mi_startup
    ...
    lf_init
    filelistinit
    nlm_client_init <-- Here
```

#### ena\_lock\_init (sys/dev/ena/ena.c:4159)

```txt
Control Flow:
mi_startup
    ...
    lf_init
    filelistinit
    nlm_client_init
    ena_lock_init <-- Here
```

#### udl\_buffer\_init (sys/dev/usb/video/udl.c:184)

```txt
Control Flow:
mi_startup
    ...
    lf_init
    filelistinit
    nlm_client_init
    ena_lock_init
    udl_buffer_init <-- Here
```

#### usb\_quirk\_init (sys/dev/usb/quirk/usb\_quirk.c:1088)

```txt
Control Flow:
mi_startup
    ...
    lf_init
    filelistinit
    nlm_client_init
    ena_lock_init
    udl_buffer_init
    usb_quirk_init <-- Here
```

#### cdceem\_init (template/usb\_template\_cdceem.c:201)

```txt
Control Flow:
mi_startup
    ...
    lf_init
    filelistinit
    nlm_client_init
    ena_lock_init
    udl_buffer_init
    usb_quirk_init
    cdceem_init <-- Here
```

#### kbd\_init (template/usb\_template\_kbd.c:237)

```txt
Control Flow:
mi_startup
    ...
    lf_init
    filelistinit
    nlm_client_init
    ena_lock_init
    udl_buffer_init
    usb_quirk_init
    cdceem_init
    kbd_init <-- Here
```

#### midi\_init (template/usb\_template\_midi.c:258)

```txt
Control Flow:
mi_startup
    ...
    lf_init
    filelistinit
    nlm_client_init
    ena_lock_init
    udl_buffer_init
    usb_quirk_init
    cdceem_init
    kbd_init
    midi_init <-- Here
```

#### modem\_init (template/usb\_template\_modem.c:272)

```txt
Control Flow:
mi_startup
    ...
    lf_init
    filelistinit
    nlm_client_init
    ena_lock_init
    udl_buffer_init
    usb_quirk_init
    cdceem_init
    kbd_init
    midi_init
    modem_init <-- Here
```

#### audio\_init (template/usb\_template\_audio.c:412)

```txt
Control Flow:
mi_startup
    ...
    lf_init
    filelistinit
    nlm_client_init
    ena_lock_init
    udl_buffer_init
    usb_quirk_init
    cdceem_init
    kbd_init
    midi_init
    modem_init
    audio_init <-- Here
```

#### phone\_init (template/usb\_template\_phone.c:430)

```txt
Control Flow:
mi_startup
    ...
    lf_init
    filelistinit
    nlm_client_init
    ena_lock_init
    udl_buffer_init
    usb_quirk_init
    cdceem_init
    kbd_init
    midi_init
    modem_init
    audio_init
    phone_init <-- Here
```

#### eth\_init (template/usb\_template\_cdce.c:279)

```txt
Control Flow:
mi_startup
    ...
    lf_init
    filelistinit
    nlm_client_init
    ena_lock_init
    udl_buffer_init
    usb_quirk_init
    cdceem_init
    kbd_init
    midi_init
    modem_init
    audio_init
    phone_init
    eth_init <-- Here
```

#### usb\_temp\_init (template/usb\_template.c:1464)

```txt
Control Flow:
mi_startup
    ...
    lf_init
    filelistinit
    nlm_client_init
    ena_lock_init
    udl_buffer_init
    usb_quirk_init
    cdceem_init
    kbd_init
    midi_init
    modem_init
    audio_init
    phone_init
    eth_init
    usb_temp_init <-- Here
```

#### serialnet\_init (template/usb\_template\_serialnet.c:386)

```txt
Control Flow:
mi_startup
    ...
    lf_init
    filelistinit
    nlm_client_init
    ena_lock_init
    udl_buffer_init
    usb_quirk_init
    cdceem_init
    kbd_init
    midi_init
    modem_init
    audio_init
    phone_init
    eth_init
    usb_temp_init
    serialnet_init <-- Here
```

#### multi\_init (template/usb\_template\_multi.c:430)

```txt
Control Flow:
mi_startup
    ...
    lf_init
    filelistinit
    nlm_client_init
    ena_lock_init
    udl_buffer_init
    usb_quirk_init
    cdceem_init
    kbd_init
    midi_init
    modem_init
    audio_init
    phone_init
    eth_init
    usb_temp_init
    serialnet_init
    multi_init <-- Here
```

#### mtp\_init (template/usb\_template\_mtp.c:267)

```txt
Control Flow:
mi_startup
    ...
    lf_init
    filelistinit
    nlm_client_init
    ena_lock_init
    udl_buffer_init
    usb_quirk_init
    cdceem_init
    kbd_init
    midi_init
    modem_init
    audio_init
    phone_init
    eth_init
    usb_temp_init
    serialnet_init
    multi_init
    mtp_init <-- Here
```

#### msc\_init (template/usb\_template\_msc.c:200)

```txt
Control Flow:
mi_startup
    ...
    lf_init
    filelistinit
    nlm_client_init
    ena_lock_init
    udl_buffer_init
    usb_quirk_init
    cdceem_init
    kbd_init
    midi_init
    modem_init
    audio_init
    phone_init
    eth_init
    usb_temp_init
    serialnet_init
    multi_init
    mtp_init
    msc_init <-- Here
```

#### mouse\_init (template/usb\_template\_mouse.c:235)

```txt
Control Flow:
mi_startup
    ...
    lf_init
    filelistinit
    nlm_client_init
    ena_lock_init
    udl_buffer_init
    usb_quirk_init
    cdceem_init
    kbd_init
    midi_init
    modem_init
    audio_init
    phone_init
    eth_init
    usb_temp_init
    serialnet_init
    multi_init
    mtp_init
    msc_init
    mouse_init <-- Here
```

#### hidquirk\_init (sys/dev/hid/hidquirk.c:404)

```txt
Control Flow:
mi_startup
    ...
    lf_init
    filelistinit
    nlm_client_init
    ena_lock_init
    udl_buffer_init
    usb_quirk_init
    cdceem_init
    kbd_init
    midi_init
    modem_init
    audio_init
    phone_init
    eth_init
    usb_temp_init
    serialnet_init
    multi_init
    mtp_init
    msc_init
    mouse_init
    hidquirk_init <-- Here
```

#### atomic64\_mtxinit (sys/kern/subr\_atomic64.c:137)

```txt
Control Flow:
mi_startup
    ...
    lf_init
    filelistinit
    nlm_client_init
    ena_lock_init
    udl_buffer_init
    usb_quirk_init
    cdceem_init
    kbd_init
    midi_init
    modem_init
    audio_init
    phone_init
    eth_init
    usb_temp_init
    serialnet_init
    multi_init
    mtp_init
    msc_init
    mouse_init
    hidquirk_init
    atomic64_mtxinit <-- Here
```

#### init\_sleepqueue\_profiling (sys/kern/subr\_sleepqueue.c:188)

```txt
Control Flow:
mi_startup
    ...
    lf_init
    filelistinit
    nlm_client_init
    ena_lock_init
    udl_buffer_init
    usb_quirk_init
    cdceem_init
    kbd_init
    midi_init
    modem_init
    audio_init
    phone_init
    eth_init
    usb_temp_init
    serialnet_init
    multi_init
    mtp_init
    msc_init
    mouse_init
    hidquirk_init
    atomic64_mtxinit
    init_sleepqueue_profiling <-- Here
```

#### kobj\_init\_mutex (sys/kern/subr\_kobj.c:72)

```txt
Control Flow:
mi_startup
    ...
    lf_init
    filelistinit
    nlm_client_init
    ena_lock_init
    udl_buffer_init
    usb_quirk_init
    cdceem_init
    kbd_init
    midi_init
    modem_init
    audio_init
    phone_init
    eth_init
    usb_temp_init
    serialnet_init
    multi_init
    mtp_init
    msc_init
    mouse_init
    hidquirk_init
    atomic64_mtxinit
    init_sleepqueue_profiling
    kobj_init_mutex <-- Here
```

#### init\_bounce\_pages (sys/kern/subr\_busdma\_bounce.c:132)

```txt
Control Flow:
mi_startup
    ...
    lf_init
    filelistinit
    nlm_client_init
    ena_lock_init
    udl_buffer_init
    usb_quirk_init
    cdceem_init
    kbd_init
    midi_init
    modem_init
    audio_init
    phone_init
    eth_init
    usb_temp_init
    serialnet_init
    multi_init
    mtp_init
    msc_init
    mouse_init
    hidquirk_init
    atomic64_mtxinit
    init_sleepqueue_profiling
    kobj_init_mutex
    init_bounce_pages <-- Here
```

#### rangelock\_sys\_init (sys/kern/kern\_rangelock.c:49)

```txt
Control Flow:
mi_startup
    ...
    lf_init
    filelistinit
    nlm_client_init
    ena_lock_init
    udl_buffer_init
    usb_quirk_init
    cdceem_init
    kbd_init
    midi_init
    modem_init
    audio_init
    phone_init
    eth_init
    usb_temp_init
    serialnet_init
    multi_init
    mtp_init
    msc_init
    mouse_init
    hidquirk_init
    atomic64_mtxinit
    init_sleepqueue_profiling
    kobj_init_mutex
    init_bounce_pages
    rangelock_sys_init <-- Here
```

#### rs\_rangeset\_init (sys/kern/subr\_rangeset.c:48)

```txt
Control Flow:
mi_startup
    ...
    lf_init
    filelistinit
    nlm_client_init
    ena_lock_init
    udl_buffer_init
    usb_quirk_init
    cdceem_init
    kbd_init
    midi_init
    modem_init
    audio_init
    phone_init
    eth_init
    usb_temp_init
    serialnet_init
    multi_init
    mtp_init
    msc_init
    mouse_init
    hidquirk_init
    atomic64_mtxinit
    init_sleepqueue_profiling
    kobj_init_mutex
    init_bounce_pages
    rangelock_sys_init
    rs_rangeset_init <-- Here
```

#### osd\_init (sys/kern/kern\_osd.c:421)

```txt
Control Flow:
mi_startup
    ...
    lf_init
    filelistinit
    nlm_client_init
    ena_lock_init
    udl_buffer_init
    usb_quirk_init
    cdceem_init
    kbd_init
    midi_init
    modem_init
    audio_init
    phone_init
    eth_init
    usb_temp_init
    serialnet_init
    multi_init
    mtp_init
    msc_init
    mouse_init
    hidquirk_init
    atomic64_mtxinit
    init_sleepqueue_profiling
    kobj_init_mutex
    init_bounce_pages
    rangelock_sys_init
    rs_rangeset_init
    osd_init <-- Here
```

#### init\_turnstile\_profiling (sys/kern/subr\_turnstile.c:398)

```txt
Control Flow:
mi_startup
    ...
    lf_init
    filelistinit
    nlm_client_init
    ena_lock_init
    udl_buffer_init
    usb_quirk_init
    cdceem_init
    kbd_init
    midi_init
    modem_init
    audio_init
    phone_init
    eth_init
    usb_temp_init
    serialnet_init
    multi_init
    mtp_init
    msc_init
    mouse_init
    hidquirk_init
    atomic64_mtxinit
    init_sleepqueue_profiling
    kobj_init_mutex
    init_bounce_pages
    rangelock_sys_init
    rs_rangeset_init
    osd_init
    init_turnstile_profiling <-- Here
```

#### init\_turnstile0 (sys/kern/subr\_turnstile.c:423)

```txt
Control Flow:
mi_startup
    ...
    lf_init
    filelistinit
    nlm_client_init
    ena_lock_init
    udl_buffer_init
    usb_quirk_init
    cdceem_init
    kbd_init
    midi_init
    modem_init
    audio_init
    phone_init
    eth_init
    usb_temp_init
    serialnet_init
    multi_init
    mtp_init
    msc_init
    mouse_init
    hidquirk_init
    atomic64_mtxinit
    init_sleepqueue_profiling
    kobj_init_mutex
    init_bounce_pages
    rangelock_sys_init
    rs_rangeset_init
    osd_init
    init_turnstile_profiling
    init_turnstile0 <-- Here
```


#### ald\_startup (sys/kern/kern\_alq.c:183)

```txt
Control Flow:
mi_startup
    ...
    lf_init
    filelistinit
    nlm_client_init
    ena_lock_init
    udl_buffer_init
    usb_quirk_init
    cdceem_init
    kbd_init
    midi_init
    modem_init
    audio_init
    phone_init
    eth_init
    usb_temp_init
    serialnet_init
    multi_init
    mtp_init
    msc_init
    mouse_init
    hidquirk_init
    atomic64_mtxinit
    init_sleepqueue_profiling
    kobj_init_mutex
    init_bounce_pages
    rangelock_sys_init
    rs_rangeset_init
    osd_init
    init_turnstile_profiling
    ald_startup <-- Here
```

#### crc32c\_init\_hw (sys/libkern/x86/crc32\_sse42.c:203)

```txt
Control Flow:
mi_startup
    ...
    lf_init
    filelistinit
    nlm_client_init
    ena_lock_init
    udl_buffer_init
    usb_quirk_init
    cdceem_init
    kbd_init
    midi_init
    modem_init
    audio_init
    phone_init
    eth_init
    usb_temp_init
    serialnet_init
    multi_init
    mtp_init
    msc_init
    mouse_init
    hidquirk_init
    atomic64_mtxinit
    init_sleepqueue_profiling
    kobj_init_mutex
    init_bounce_pages
    rangelock_sys_init
    rs_rangeset_init
    osd_init
    init_turnstile_profiling
    ald_startup
    crc32c_init_hw <-- Here
```

#### chacha20\_init (sys/libkern/arc4random.c:160)

```txt
Control Flow:
mi_startup
    ...
    lf_init
    filelistinit
    nlm_client_init
    ena_lock_init
    udl_buffer_init
    usb_quirk_init
    cdceem_init
    kbd_init
    midi_init
    modem_init
    audio_init
    phone_init
    eth_init
    usb_temp_init
    serialnet_init
    multi_init
    mtp_init
    msc_init
    mouse_init
    hidquirk_init
    atomic64_mtxinit
    init_sleepqueue_profiling
    kobj_init_mutex
    init_bounce_pages
    rangelock_sys_init
    rs_rangeset_init
    osd_init
    init_turnstile_profiling
    ald_startup
    crc32c_init_hw
    chacha20_init <-- Here
```

### SI\_SUB\_EVENTHANDLER

#### eventhandler\_init (sys/kern/subr\_eventhandler.c:59)

```txt
Control Flow:
mi_startup
    ...
    eventhandler_init <-- Here
```

#### gcov\_init (sys/gnu/gcov/gcov\_subr.c:153)

```txt
Control Flow:
mi_startup
    ...
    eventhandler_init
    gcov_init <-- Here
```

#### umtxq\_sysinit (sys/kern/kern\_umtx.c:324)

```txt
Control Flow:
mi_startup
    ...
    eventhandler_init
    gcov_init
    umtxq_sysinit <-- Here
```

#### dn\_evh\_init (sys/net/debugnet.c:919)

```txt
Control Flow:
mi_startup
    ...
    eventhandler_init
    gcov_init
    umtxq_sysinit
    dn_evh_init <-- Here
```

### SI\_SUB\_VNET\_PRELINK

#### vnet\_init\_prelink (sys/net/vnet.c:310)

```txt
Control Flow:
mi_startup
    ...
    vnet_init_prelink <-- Here
```

### SI\_SUB\_KLD

#### ipoib\_unrhdr\_init (infiniband/ulp/ipoib/ipoib\_main.c:100)

```txt
Control Flow:
mi_startup
    ...
    ipoib_unrhdr_init <-- Here
```

#### ucom\_init (usb/serial/usb\_serial.c:197)

```txt
Control Flow:
mi_startup
    ...
    ipoib_unrhdr_init
    ucom_init <-- Here
```

#### linker\_init (sys/kern/kern\_linker.c:157)

```txt
Control Flow:
mi_startup
    ...
    ipoib_unrhdr_init
    ucom_init
    linker_init <-- Here
```

#### dpcpu\_startup (sys/kern/subr\_pcpu.c:121)

```txt
Control Flow:
mi_startup
    ...
    ipoib_unrhdr_init
    ucom_init
    linker_init
    dpcpu_startup <-- Here
```

#### module\_init (sys/kern/kern\_module.c:81)

```txt
Control Flow:
mi_startup
    ...
    ipoib_unrhdr_init
    ucom_init
    linker_init
    dpcpu_startup
    module_init <-- Here
```

#### vnet\_data\_startup (sys/net/vnet.c:350)

```txt
Control Flow:
mi_startup
    ...
    ipoib_unrhdr_init
    ucom_init
    linker_init
    dpcpu_startup
    module_init
    vnet_data_startup <-- Here
```

#### usb\_dev\_init (usb/usb\_dev.c:964)

```txt
Control Flow:
mi_startup
    ...
    ipoib_unrhdr_init
    ucom_init
    linker_init
    dpcpu_startup
    module_init
    vnet_data_startup
    usb_dev_init <-- Here
```

#### link\_elf\_init (sys/kern/link\_elf\_obj.c:203)

```txt
Control Flow:
mi_startup
    ...
    ipoib_unrhdr_init
    ucom_init
    linker_init
    dpcpu_startup
    module_init
    vnet_data_startup
    usb_dev_init
    link_elf_init <-- Here
```

#### link\_elf\_init (sys/kern/link\_elf.c:435)

```txt
Control Flow:
mi_startup
    ...
    ipoib_unrhdr_init
    ucom_init
    linker_init
    dpcpu_startup
    module_init
    vnet_data_startup
    usb_dev_init
    link_elf_init
    link_elf_init <-- Here
```

#### linker\_preload (sys/kern/kern\_linker.c:1573)

```txt
Control Flow:
mi_startup
    ...
    ipoib_unrhdr_init
    ucom_init
    linker_init
    dpcpu_startup
    module_init
    vnet_data_startup
    usb_dev_init
    link_elf_init
    link_elf_init
    linker_preload <-- Here
```

#### drm\_magic\_init (sys/dev/drm2/drm\_auth.c:199)

```txt
Control Flow:
mi_startup
    ...
    ipoib_unrhdr_init
    ucom_init
    linker_init
    dpcpu_startup
    module_init
    vnet_data_startup
    usb_dev_init
    link_elf_init
    link_elf_init
    linker_preload
    drm_magic_init <-- Here
```

#### drm\_core\_init (sys/dev/drm2/drm\_drv.c:255)

```txt
Control Flow:
mi_startup
    ...
    ipoib_unrhdr_init
    ucom_init
    linker_init
    dpcpu_startup
    module_init
    vnet_data_startup
    usb_dev_init
    link_elf_init
    link_elf_init
    linker_preload
    drm_magic_init
    drm_core_init <-- Here
```

#### linker\_stop\_class\_add (sys/kern/kern\_linker.c:168)

```txt
Control Flow:
mi_startup
    ...
    ipoib_unrhdr_init
    ucom_init
    linker_init
    dpcpu_startup
    module_init
    vnet_data_startup
    usb_dev_init
    link_elf_init
    link_elf_init
    linker_preload
    drm_magic_init
    drm_core_init
    linker_stop_class_add <-- Here
```

#### linker\_init\_kernel\_modules (sys/kern/kern\_linker.c:417)

```txt
Control Flow:
mi_startup
    ...
    ipoib_unrhdr_init
    ucom_init
    linker_init
    dpcpu_startup
    module_init
    vnet_data_startup
    usb_dev_init
    link_elf_init
    link_elf_init
    linker_preload
    drm_magic_init
    drm_core_init
    linker_stop_class_add
    linker_init_kernel_modules <-- Here
```

#### memguard\_sysinit (sys/vm/memguard.c:226)

```txt
Control Flow:
mi_startup
    ...
    ipoib_unrhdr_init
    ucom_init
    linker_init
    dpcpu_startup
    module_init
    vnet_data_startup
    usb_dev_init
    link_elf_init
    link_elf_init
    linker_preload
    drm_magic_init
    drm_core_init
    linker_stop_class_add
    linker_init_kernel_modules
    memguard_sysinit <-- Here
```

#### acpi\_pm\_register (sys/dev/acpica/acpi.c:4627)

```txt
Control Flow:
mi_startup
    ...
    ipoib_unrhdr_init
    ucom_init
    linker_init
    dpcpu_startup
    module_init
    vnet_data_startup
    usb_dev_init
    link_elf_init
    link_elf_init
    linker_preload
    drm_magic_init
    drm_core_init
    linker_stop_class_add
    linker_init_kernel_modules
    memguard_sysinit
    acpi_pm_register <-- Here
```

### SI\_SUB\_CPU

#### cpu\_startup (sys/amd64/amd64/machdep.c:223)

```txt
Control Flow:
mi_startup
    ...
    cpu_startup <-- Here
```

#### cpu\_alloc (sys/x86/x86/mp\_x86.c:978)

```txt
Control Flow:
mi_startup
    ...
    cpu_startup
    cpu_alloc <-- Here
```

#### log\_msg (sys/x86/x86/ucode.c:84)

```txt
Control Flow:
mi_startup
    ...
    cpu_startup
    cpu_alloc
    log_msg <-- Here
```

#### psci\_init (sys/dev/psci/psci.c:136)

```txt
Control Flow:
mi_startup
    ...
    cpu_startup
    cpu_alloc
    log_msg
    psci_init <-- Here
```

#### apic\_setup\_local (sys/x86/x86/local\_apic.c:1904)

```txt
Control Flow:
mi_startup
    ...
    cpu_startup
    cpu_alloc
    log_msg
    psci_init
    apic_setup_local <-- Here
```

#### mp\_start (sys/kern/subr\_smp.c:162)

```txt
Control Flow:
mi_startup
    ...
    cpu_startup
    cpu_alloc
    log_msg
    psci_init
    apic_setup_local
    mp_start <-- Here
```

#### madt\_set\_ids (sys/x86/acpica/madt.c:754)

```txt
Control Flow:
mi_startup
    ...
    cpu_startup
    cpu_alloc
    log_msg
    psci_init
    apic_setup_local
    mp_start
    madt_set_ids <-- Here
```

#### cpu\_idle\_tun (sys/x86/x86/cpu\_machdep.c:810)

```txt
Control Flow:
mi_startup
    ...
    cpu_startup
    cpu_alloc
    log_msg
    psci_init
    apic_setup_local
    mp_start
    madt_set_ids
    cpu_idle_tun <-- Here
```

#### x86bios\_modevent (sys/compat/x86bios/x86bios.c:842)

```txt
Control Flow:
mi_startup
    ...
    cpu_startup
    cpu_alloc
    log_msg
    psci_init
    apic_setup_local
    mp_start
    madt_set_ids
    cpu_idle_tun
    x86bios_modevent <-- Here
```

#### cluster\_init (sys/kern/vfs\_cluster.c:81)

```txt
Control Flow:
mi_startup
    ...
    cpu_startup
    cpu_alloc
    log_msg
    psci_init
    apic_setup_local
    mp_start
    madt_set_ids
    cpu_idle_tun
    x86bios_modevent
    cluster_init <-- Here
```

#### boottrace\_init (sys/kern/kern\_boottrace.c:583)

```txt
Control Flow:
mi_startup
    ...
    cpu_startup
    cpu_alloc
    log_msg
    psci_init
    apic_setup_local
    mp_start
    madt_set_ids
    cpu_idle_tun
    x86bios_modevent
    cluster_init
    boottrace_init <-- Here
```

#### prng\_init (sys/kern/subr\_prng.c:72)

```txt
Control Flow:
mi_startup
    ...
    cpu_startup
    cpu_alloc
    log_msg
    psci_init
    apic_setup_local
    mp_start
    madt_set_ids
    cpu_idle_tun
    x86bios_modevent
    cluster_init
    boottrace_init
    prng_init <-- Here
```

#### callout\_callwheel\_init (sys/kern/kern\_timeout.c:275)

```txt
Control Flow:
mi_startup
    ...
    cpu_startup
    cpu_alloc
    log_msg
    psci_init
    apic_setup_local
    mp_start
    madt_set_ids
    cpu_idle_tun
    x86bios_modevent
    cluster_init
    boottrace_init
    prng_init
    callout_callwheel_init <-- Here
```

#### fpuinitstate (sys/amd64/amd64/fpu.c:413)

```txt
Control Flow:
mi_startup
    ...
    cpu_startup
    cpu_alloc
    log_msg
    psci_init
    apic_setup_local
    mp_start
    madt_set_ids
    cpu_idle_tun
    x86bios_modevent
    cluster_init
    boottrace_init
    prng_init
    callout_callwheel_init
    fpuinitstate <-- Here
```

#### late\_ifunc\_resolve (sys/amd64/amd64/machdep.c:315)

```txt
Control Flow:
mi_startup
    ...
    cpu_startup
    cpu_alloc
    log_msg
    psci_init
    apic_setup_local
    mp_start
    madt_set_ids
    cpu_idle_tun
    x86bios_modevent
    cluster_init
    boottrace_init
    prng_init
    callout_callwheel_init
    fpuinitstate
    late_ifunc_resolve <-- Here
```

#### vnode\_pager\_init (sys/vm/vnode\_pager.c:137)

```txt
Control Flow:
mi_startup
    ...
    cpu_startup
    cpu_alloc
    log_msg
    psci_init
    apic_setup_local
    mp_start
    madt_set_ids
    cpu_idle_tun
    x86bios_modevent
    cluster_init
    boottrace_init
    prng_init
    callout_callwheel_init
    fpuinitstate
    late_ifunc_resolve
    vnode_pager_init <-- Here
```

#### mca\_init\_bsp (sys/x86/x86/mca.c:1496)

```txt
Control Flow:
mi_startup
    ...
    cpu_startup
    cpu_alloc
    log_msg
    psci_init
    apic_setup_local
    mp_start
    madt_set_ids
    cpu_idle_tun
    x86bios_modevent
    cluster_init
    boottrace_init
    prng_init
    callout_callwheel_init
    fpuinitstate
    late_ifunc_resolve
    vnode_pager_init
    mca_init_bsp <-- Here
```

#### x86\_mem\_drvinit (sys/x86/x86/x86\_mem.c:715)

```txt
Control Flow:
mi_startup
    ...
    cpu_startup
    cpu_alloc
    log_msg
    psci_init
    apic_setup_local
    mp_start
    madt_set_ids
    cpu_idle_tun
    x86bios_modevent
    cluster_init
    boottrace_init
    prng_init
    callout_callwheel_init
    fpuinitstate
    late_ifunc_resolve
    vnode_pager_init
    mca_init_bsp
    x86_mem_drvinit <-- Here
```

#### pmap\_delayed\_invl\_callout\_init (sys/amd64/amd64/pmap.c:1093)

```txt
Control Flow:
mi_startup
    ...
    cpu_startup
    cpu_alloc
    log_msg
    psci_init
    apic_setup_local
    mp_start
    madt_set_ids
    cpu_idle_tun
    x86bios_modevent
    cluster_init
    boottrace_init
    prng_init
    callout_callwheel_init
    fpuinitstate
    late_ifunc_resolve
    vnode_pager_init
    mca_init_bsp
    x86_mem_drvinit
    pmap_delayed_invl_callout_init <-- here
```

#### pmap\_cpu\_init (sys/amd64/amd64/pmap.c:11169)

```txt
Control Flow:
mi_startup
    ...
    cpu_startup
    cpu_alloc
    log_msg
    psci_init
    apic_setup_local
    mp_start
    madt_set_ids
    cpu_idle_tun
    x86bios_modevent
    cluster_init
    boottrace_init
    prng_init
    callout_callwheel_init
    fpuinitstate
    late_ifunc_resolve
    vnode_pager_init
    mca_init_bsp
    x86_mem_drvinit
    pmap_delayed_invl_callout_init
    pmap_cpu_init <-- Here
```

### SI\_SUB\_RACCT

#### racct\_init (sys/kern/kern\_racct.c:1350)

```txt
Control Flow:
mi_startup
    ...
    racct_init <-- Here
```

#### rctl\_init (sys/kern/kern\_rctl.c:2178)

```txt
Control Flow:
mi_startup
    ...
    racct_init
    rctl_init <-- Here
```

### SI\_SUB\_KDTRACE

#### stats\_init (sys/kern/subr\_stats.c:3694)

```txt
Control Flow:
mi_startup
    ...
    stats_init <-- Here
```

#### init\_hwpmc (sys/kern/kern\_pmc.c:336)

```txt
Control Flow:
mi_startup
    ...
    stats_init
    init_hwpmc <-- Here
```

#### dtrace\_debug\_init (sys/cddl/dev/dtrace/dtrace\_debug.c:65)

```txt
Control Flow:
mi_startup
    ...
    stats_init
    init_hwpmc
    dtrace_debug_init <-- Here
```

### SI\_SUB\_RANDOM

### SI\_SUB\_MAC

#### mac\_init (sys/security/mac/mac\_framework.c:318)

```txt
Control Flow:
mi_startup
    ...
    mac_init <-- Here
```

### SI\_SUB\_MAC\_POLICY

### SI\_SUB\_MAC\_LATE

#### mac\_late\_init (sys/security/mac/mac\_framework.c:338)

```txt
Control Flow:
mi_startup
    ...
    mac_late_init <-- Here

341: mac_late = 1;
```

#### mac\_veriexec\_late\_init (sys/security/mac\_veriexec/veriexec\_fingerprint.c:460)

```txt
Control Flow:
mi_startup
    ...
    mac_late_init
    mac_veriexec_late_init <-- Here

463: mac_veriexec_late = 1;
```

### SI\_SUB\_VNET

### SI\_SUB\_INTRINSIC

### SI\_SUB\_VM\_CONF

### SI\_SUB\_DDB\_SERVICES

### SI\_SUB\_RUN\_QUEUE

### SI\_SUB\_KTRACE

### SI\_SUB\_OPENSOLARIS

### SI\_SUB\_AUDIT

### SI\_SUB\_CREATE\_INIT

### SI\_SUB\_SCHED\_IDLE

### SI\_SUB\_MBUF

### SI\_SUB\_INTR

### SI\_SUB\_TASKQ

### SI\_SUB\_EPOCH

### SI\_SUB\_SMP

### SI\_SUB\_SOFTINTR

### SI\_SUB\_DEVFS

### SI\_SUB\_INIT\_IF

### SI\_SUB\_NETGRAPH

### SI\_SUB\_DTRACE

### SI\_SUB\_DTRACE\_PROVIDER

### SI\_SUB\_DTRACE\_ANON

### SI\_SUB\_DRIVERS

### SI\_SUB\_CONFIGURE

### SI\_SUB\_VFS

### SI\_SUB\_CLOCKS

### SI\_SUB\_PSEUDO

### SI\_SUB\_EXEC

### SI\_SUB\_PROTO\_BEGIN

### SI\_SUB\_PROTO\_PFIL

### SI\_SUB\_IF

### SI\_SUB\_DOMAININIT

### SI\_SUB\_MC

### SI\_SUB\_DOMAIN

### SI\_SUB\_FIREWALL

### SI\_SUB\_IFATTACHDOMAIN

### SI\_SUB\_PROTO\_END

### SI\_SUB\_KICK\_SCHEDULER

### SI\_SUB\_INIT\_CONFIG\_HOOKS

### SI\_SUB\_ROOT\_CONF

### SI\_SUB\_INTRINSIC\_POST

### SI\_SUB\_SYSCALLS

#### selectinit (sys/kern/sys\_generic.c:2062)

```txt
Control Flow:
mi_startup
    ...
    selectinit <-- Here
```

#### sctp\_syscalls\_init (sys/netinet/sctp\_syscalls.c:101)

```txt
Control Flow:
mi_startup
    ...
    selectinit
    sctp_syscalls_init <-- Here
```
### SI\_SUB\_VNET\_DONE

#### nfs\_vnetinit (sys/fs/nfs/nfs\_commonport.c:874)

```txt
Control Flow:
mi_startup
    ...
    nfs_vnetinit <-- Here
```

#### vnet\_init\_done (sys/net/vnet.c:338)

```txt
Control Flow:
mi_startup
    ...
    nfs_vnetinit
    vnet_init_done <-- Here
```

#### vnet\_sysinit\_done (sys/net/vnet.c:364)

```txt
Control Flow:
mi_startup
    ...
    nfs_vnetinit
    vnet_init_done
    vnet_sysinit_done <-- Here
```

#### svc\_rpc\_gss\_vnetinit (sys/rpc/rpcsec\_gss/sbc\_rpcsec\_gss.c:223)

```txt
Control Flow:
mi_startup
    ...
    nfs_vnetinit
    vnet_init_done
    vnet_sysinit_done
    svc_rpc_gss_vnetinit <-- Here
```

#### rpctls\_vnetinit (sys/rpc/rpcsec\_tls/rpctls\_impl.c:99)

```txt
Control Flow:
mi_startup
    ...
    nfs_vnetinit
    vnet_init_done
    vnet_sysinit_done
    svc_rpc_gss_vnetinit
    rpctls_vnetinit <-- Here
```

#### frag6\_slowtimo\_init (sys/netinet6/frag6.c:1004)

```txt
Control Flow:
mi_startup
    ...
    nfs_vnetinit
    vnet_init_done
    vnet_sysinit_done
    svc_rpc_gss_vnetinit
    rpctls_vnetinit
    frag6_slowtimo_init <-- Here
```

#### fhanew\_init (sys/fs/nfsserver/nfs\_fha\_new.c:105)

```txt
Control Flow:
mi_startup
    ...
    nfs_vnetinit
    vnet_init_done
    vnet_sysinit_done
    svc_rpc_gss_vnetinit
    rpctls_vnetinit
    frag6_slowtimo_init
    fhanew_init <-- Here
```

#### nfsrv\_vnetinit (sys/fs/nfsserver/nfs\_nfsdport.c:7176)

```txt
Control Flow:
mi_startup
    ...
    nfs_vnetinit
    vnet_init_done
    vnet_sysinit_done
    svc_rpc_gss_vnetinit
    rpctls_vnetinit
    frag6_slowtimo_init
    fhanew_init
    nfsrv_vnetinit <-- Here

7179: Calls nfsd_mntinit.
```

#### nfsd\_mntinit (sys/fs/nfsserver/nfs\_nfsdport.c:3600)

```txt
Control Flow:
mi_startup
    ...
    nfs_vnetinit
    vnet_init_done
    vnet_sysinit_done
    svc_rpc_gss_vnetinit
    rpctls_vnetinit
    frag6_slowtimo_init
    fhanew_init
    nfsrv_vnetinit
    nfsd_mntinit <-- Here
```

### SI\_SUB\_KTHREAD\_INIT

#### linker\_preload\_finish (sys/kern/kern\_linker.c:1784)

```txt
Control Flow:
mi_startup
    ...
    linker_preload_finish <-- Here
```

#### kick\_init (sys/kern/init\_main.c:860)

```txt
Control Flow:
mi_startup
    ...
    linker_preload_finish
    kick_init <-- Here
```

### SI\_SUB\_KTHREAD\_PAGE

#### vm\_pageout\_init (sys/vm/vm\_pageout.c:2301)

```txt
Control Flow:
mi_startup
    ...
    vm_pageout_init <-- Here
```

#### kproc\_start (sys/vm/kern\_kthread.c:60)

```txt
Control Flow:
mi_startup
    ...
    vm_pageout_init
    kproc_start <-- Here

Note: Called with page_kp as an argument.
```

#### vm\_pageout (sys/vm/vm\_pageout.c:2349)

```txt
Control Flow:
mi_startup
    ...
    vm_pageout_init
    kproc_start --> vm_pageout <-- Here
```

### SI\_SUB\_KTHREAD\_VM

#### vm\_daemon (sys/vm/vm\_swapout.c:371)

```txt
Control Flow:
mi_startup
    ...
    kproc_start --> vm_daemon <-- Here
```

#### poll\_idle (sys/kern/kern\_poll.c:552)

```txt
Control Flow:
mi_startup
    ...
    kproc_start
    kproc_start --> poll_idle <-- Here
```

### SI\_SUB\_KTHREAD\_BUF

#### buf\_daemon (sys/kern/vfs\_bio.c:3447)

```txt
Control Flow:
mi_startup
    ...
    kproc_start --> buf_daemon <-- Here
```

#### pbuf\_prealloc (sys/vm/vm\_pager.c:241)

```txt
Control Flow:
mi_startup
    ...
    buf_daemon
    pbuf_prealloc <-- Here
```

### SI\_SUB\_KTHREAD\_UPDATE

#### vnlru\_proc (sys/kern/vfs\_subr.c:1740)

```txt
Control Flow:
mi_startup
    ...
    kproc_start --> vnlru_proc <-- Here
```

#### sched\_sync (sys/kern/vfs\_subr.c:2951)

```txt
Control Flow:
mi_startup
    ...
    vnlru_proc
    kproc_start --> sched_sync <-- Here
```

### SI\_SUB\_IDLE

### SI\_SUB\_RACCTD

#### racctd\_init (sys/kern/kern\_ract.c:1340)

```txt
Control Flow:
mi_startup
    ...
    racctd_init <-- Here
```

### SI\_SUB\_LAST
