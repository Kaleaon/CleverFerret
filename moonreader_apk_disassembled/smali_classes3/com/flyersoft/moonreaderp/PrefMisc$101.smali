.class Lcom/flyersoft/moonreaderp/PrefMisc$101;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Lcom/flyersoft/tools/compress/MyZip_Base$ZipDone;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->restoreProc_over2(Landroid/content/Context;Landroid/os/Handler;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$fromMain:Z

.field final synthetic val$handler:Landroid/os/Handler;


# direct methods
.method constructor <init>(ZLandroid/os/Handler;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 2584
    iput-boolean p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$101;->val$fromMain:Z

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$101;->val$handler:Landroid/os/Handler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private deleteUnusedShare_PrefFiles(Ljava/util/ArrayList;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x1

    .line 2696
    new-array v1, v0, [Ljava/lang/Object;

    const/4 v2, 0x0

    const-string v3, "==================delete unused files================(1)"

    aput-object v3, v1, v2

    invoke-static {v1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 2697
    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 2699
    :try_start_0
    sget-object v1, Lcom/flyersoft/tools/A;->appDataPath:Ljava/lang/String;

    invoke-static {v1, v0, v0, v0, v2}, Lcom/flyersoft/tools/T;->getFolderFileList(Ljava/lang/String;ZZZZ)Ljava/util/ArrayList;

    move-result-object v1

    .line 2700
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 2701
    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 2702
    const-string v4, "/lib"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    const-string v4, ".licensing."

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 2703
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "delete: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v3}, Lcom/flyersoft/tools/T;->deleteFile(Ljava/lang/String;)Z

    move-result v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    new-array v4, v0, [Ljava/lang/Object;

    aput-object v3, v4, v2

    invoke-static {v4}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    .line 2705
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 2707
    :cond_1
    new-array p1, v0, [Ljava/lang/Object;

    const-string v0, "==================delete unused files================(2)"

    aput-object v0, p1, v2

    invoke-static {p1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    return-void
.end method

.method private getValue(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;
    .locals 2

    .line 2711
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "\""

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result p2

    if-lez p2, :cond_1

    if-eqz p3, :cond_0

    .line 2715
    :try_start_0
    const-string p3, ">"

    invoke-virtual {p1, p3, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result p2

    .line 2716
    const-string p3, "<"

    invoke-virtual {p1, p3, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result p3

    add-int/lit8 p2, p2, 0x1

    .line 2717
    invoke-virtual {p1, p2, p3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 2719
    :cond_0
    const-string p3, "value="

    invoke-virtual {p1, p3, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result p2

    add-int/lit8 p2, p2, 0x7

    .line 2720
    invoke-virtual {p1, v1, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result p3

    .line 2721
    invoke-virtual {p1, p2, p3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 2724
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 2726
    :cond_1
    const-string p1, ""

    return-object p1
.end method

.method private sameScreenSize(Ljava/lang/String;)Z
    .locals 5

    const/4 v0, 0x0

    .line 2733
    :try_start_0
    const-string v1, "screensize"

    invoke-direct {p0, p1, v1, v0}, Lcom/flyersoft/moonreaderp/PrefMisc$101;->getValue(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 2735
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    const-wide/16 v1, 0x0

    .line 2737
    :goto_0
    sget-wide v3, Lcom/flyersoft/tools/A;->screensize:J

    cmp-long p1, v3, v1

    if-nez p1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method private updateValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;
    .locals 2

    .line 2741
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "name=\""

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v1, 0x0

    if-lez v0, :cond_1

    if-eqz p4, :cond_0

    .line 2744
    const-string p2, ">"

    invoke-virtual {p1, p2, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result p2

    .line 2745
    const-string p4, "<"

    invoke-virtual {p1, p4, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result p4

    .line 2746
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    add-int/lit8 p2, p2, 0x1

    invoke-virtual {p1, v1, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 2748
    :cond_0
    const-string p2, "value="

    invoke-virtual {p1, p2, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result p2

    add-int/lit8 p2, p2, 0x7

    .line 2749
    const-string p4, "\" "

    invoke-virtual {p1, p4, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result p4

    .line 2750
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v1, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 2753
    :cond_1
    const-string p3, "v10.2"

    invoke-virtual {p2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_2

    .line 2754
    const-string p2, "<boolean"

    invoke-virtual {p1, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result p2

    if-lez p2, :cond_2

    .line 2756
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v1, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p4, "<boolean name=\"v10.2\" value=\"false\" />\n    "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2758
    invoke-virtual {p1, p2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :cond_2
    return-object p1
.end method


# virtual methods
.method public OnZipDone(Ljava/lang/String;Ljava/util/ArrayList;)V
    .locals 25
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    move-object/from16 v1, p0

    move-object/from16 v0, p1

    .line 2587
    const-string v2, "auto_import_time"

    const-string v3, "inviteProVersion"

    const-string v4, "forceRebootToMain"

    const-string v5, "forceRebootToTxt"

    const-string v6, "v10.2"

    const-string v7, "default_book_folder"

    const-string v8, "doMediaPlayPrevious"

    const-string v9, "doMediaPlayNext"

    const-string v10, "doMediaPlayPause"

    const-string v11, "doHeadsetKey"

    const-string v12, "doShakePhone"

    const-string v13, "needPasswordProtect"

    const-string v14, "mult_touch"

    const-string v15, "15"

    move-object/from16 v16, v7

    const-string v7, "false"

    move-object/from16 v17, v15

    .line 0
    const-string v15, ""

    move-object/from16 v18, v8

    const-string v8, "/options1002.xml"

    move-object/from16 v19, v9

    .line 2587
    new-instance v9, Ljava/lang/StringBuilder;

    move-object/from16 v20, v10

    const-string v10, "#restorePro_final done, err: "

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x1

    move-object/from16 v21, v9

    new-array v9, v10, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object v21, v9, v10

    invoke-static {v9}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    if-nez v0, :cond_c

    .line 2591
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v9, Lcom/flyersoft/tools/A;->xml_files_folder:Ljava/lang/String;

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getFileText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 2592
    const-string v9, "isFoldablePhone"

    invoke-direct {v1, v0, v9, v7, v10}, Lcom/flyersoft/moonreaderp/PrefMisc$101;->updateValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 2593
    invoke-direct {v1, v0, v6, v7, v10}, Lcom/flyersoft/moonreaderp/PrefMisc$101;->updateValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 2594
    const-string v9, "cutoutScreen3"
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_9

    move-object/from16 v21, v6

    :try_start_1
    const-string v6, "0"

    invoke-direct {v1, v0, v9, v6, v10}, Lcom/flyersoft/moonreaderp/PrefMisc$101;->updateValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 2595
    iget-boolean v6, v1, Lcom/flyersoft/moonreaderp/PrefMisc$101;->val$fromMain:Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_8

    const-string v9, "true"

    if-eqz v6, :cond_0

    move-object v6, v7

    goto :goto_0

    :cond_0
    move-object v6, v9

    :goto_0
    :try_start_2
    invoke-direct {v1, v0, v5, v6, v10}, Lcom/flyersoft/moonreaderp/PrefMisc$101;->updateValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 2596
    iget-boolean v6, v1, Lcom/flyersoft/moonreaderp/PrefMisc$101;->val$fromMain:Z

    if-nez v6, :cond_1

    move-object v6, v7

    goto :goto_1

    :cond_1
    move-object v6, v9

    :goto_1
    invoke-direct {v1, v0, v4, v6, v10}, Lcom/flyersoft/moonreaderp/PrefMisc$101;->updateValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 2597
    invoke-direct {v1, v0, v3, v7, v10}, Lcom/flyersoft/moonreaderp/PrefMisc$101;->updateValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 2599
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_8

    move-object/from16 v23, v11

    :try_start_3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    invoke-virtual {v6, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v10, 0x0

    invoke-direct {v1, v0, v2, v6, v10}, Lcom/flyersoft/moonreaderp/PrefMisc$101;->updateValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 2600
    const-string v6, "immersive_fullscreen"

    invoke-direct {v1, v0, v6, v9, v10}, Lcom/flyersoft/moonreaderp/PrefMisc$101;->updateValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 2601
    const-string v6, "deviceRandomID2"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_7

    move-object v11, v2

    move-object/from16 v24, v3

    :try_start_4
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v10, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    invoke-direct {v1, v0, v6, v2, v3}, Lcom/flyersoft/moonreaderp/PrefMisc$101;->updateValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 2602
    invoke-direct {v1, v0}, Lcom/flyersoft/moonreaderp/PrefMisc$101;->sameScreenSize(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 2603
    const-string v2, "fitCutout3"

    const-string v3, "0"

    const/4 v10, 0x0

    invoke-direct {v1, v0, v2, v3, v10}, Lcom/flyersoft/moonreaderp/PrefMisc$101;->updateValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 2604
    const-string v2, "statusFontSize"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v6, Lcom/flyersoft/tools/A;->statusFontSize:I

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v10, 0x0

    invoke-direct {v1, v0, v2, v3, v10}, Lcom/flyersoft/moonreaderp/PrefMisc$101;->updateValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 2605
    const-string v2, "statusMargin"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v6, Lcom/flyersoft/tools/A;->statusMargin:I

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v10, 0x0

    invoke-direct {v1, v0, v2, v3, v10}, Lcom/flyersoft/moonreaderp/PrefMisc$101;->updateValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 2606
    const-string v2, "shelfFontSize5"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v6, Lcom/flyersoft/tools/A;->shelfFontSize:I

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v10, 0x0

    invoke-direct {v1, v0, v2, v3, v10}, Lcom/flyersoft/moonreaderp/PrefMisc$101;->updateValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 2607
    const-string v2, "shelfCoverSize6"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v6, Lcom/flyersoft/tools/A;->shelfCoverSize:I

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v10, 0x0

    invoke-direct {v1, v0, v2, v3, v10}, Lcom/flyersoft/moonreaderp/PrefMisc$101;->updateValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 2608
    const-string v2, "netCoverSize5"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v6, Lcom/flyersoft/tools/A;->netCoverSize:I

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v10, 0x0

    invoke-direct {v1, v0, v2, v3, v10}, Lcom/flyersoft/moonreaderp/PrefMisc$101;->updateValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 2609
    const-string v2, "fileCoverSize5"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v6, Lcom/flyersoft/tools/A;->fileCoverSize:I

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v10, 0x0

    invoke-direct {v1, v0, v2, v3, v10}, Lcom/flyersoft/moonreaderp/PrefMisc$101;->updateValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 2611
    :cond_2
    invoke-static {}, Lcom/flyersoft/tools/A;->isPro()Z

    move-result v2
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_6

    if-eqz v2, :cond_5

    :try_start_5
    sget-object v2, Lcom/flyersoft/moonreaderp/PrefMisc;->selectedBackup:Ljava/lang/String;

    const-string v3, "mrstd"

    invoke-virtual {v2, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_5

    .line 2612
    sget-boolean v2, Lcom/flyersoft/tools/A;->mult_touch:Z

    if-eqz v2, :cond_3

    move-object v2, v9

    goto :goto_2

    :cond_3
    move-object v2, v7

    :goto_2
    const/4 v10, 0x0

    invoke-direct {v1, v0, v14, v2, v10}, Lcom/flyersoft/moonreaderp/PrefMisc$101;->updateValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 2613
    sget-boolean v2, Lcom/flyersoft/tools/A;->needPasswordProtect:Z

    if-eqz v2, :cond_4

    goto :goto_3

    :cond_4
    move-object v9, v7

    :goto_3
    invoke-direct {v1, v0, v13, v9, v10}, Lcom/flyersoft/moonreaderp/PrefMisc$101;->updateValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 2614
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v3, Lcom/flyersoft/tools/A;->doShakePhone:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v10, 0x0

    invoke-direct {v1, v0, v12, v2, v10}, Lcom/flyersoft/moonreaderp/PrefMisc$101;->updateValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 2615
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v3, Lcom/flyersoft/tools/A;->doHeadsetKey:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    move-object/from16 v3, v23

    const/4 v10, 0x0

    :try_start_6
    invoke-direct {v1, v0, v3, v2, v10}, Lcom/flyersoft/moonreaderp/PrefMisc$101;->updateValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 2616
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v6, Lcom/flyersoft/tools/A;->doMediaPlayPause:I

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2

    move-object/from16 v6, v20

    const/4 v10, 0x0

    :try_start_7
    invoke-direct {v1, v0, v6, v2, v10}, Lcom/flyersoft/moonreaderp/PrefMisc$101;->updateValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 2617
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v9, Lcom/flyersoft/tools/A;->doMediaPlayNext:I

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_1

    move-object/from16 v9, v19

    const/4 v10, 0x0

    :try_start_8
    invoke-direct {v1, v0, v9, v2, v10}, Lcom/flyersoft/moonreaderp/PrefMisc$101;->updateValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 2618
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v10, Lcom/flyersoft/tools/A;->doMediaPlayPrevious:I

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_0

    move-object/from16 v10, v18

    move-object/from16 v18, v11

    const/4 v11, 0x0

    :try_start_9
    invoke-direct {v1, v0, v10, v2, v11}, Lcom/flyersoft/moonreaderp/PrefMisc$101;->updateValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    goto :goto_5

    :catch_0
    move-exception v0

    move-object/from16 v10, v18

    goto :goto_4

    :catch_1
    move-exception v0

    move-object/from16 v10, v18

    move-object/from16 v9, v19

    goto :goto_4

    :catch_2
    move-exception v0

    move-object/from16 v10, v18

    move-object/from16 v9, v19

    move-object/from16 v6, v20

    goto :goto_4

    :catch_3
    move-exception v0

    move-object/from16 v10, v18

    move-object/from16 v9, v19

    move-object/from16 v6, v20

    move-object/from16 v3, v23

    :goto_4
    move-object/from16 v18, v11

    goto/16 :goto_8

    :cond_5
    move-object/from16 v10, v18

    move-object/from16 v9, v19

    move-object/from16 v6, v20

    move-object/from16 v3, v23

    move-object/from16 v18, v11

    .line 2620
    :goto_5
    invoke-static {}, Lcom/flyersoft/tools/A;->isPro()Z

    move-result v2

    if-nez v2, :cond_6

    sget-object v2, Lcom/flyersoft/moonreaderp/PrefMisc;->selectedBackup:Ljava/lang/String;

    const-string v11, "mrpro"

    invoke-virtual {v2, v11}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    const/4 v11, -0x1

    if-eq v2, v11, :cond_6

    const/4 v11, 0x0

    .line 2621
    invoke-direct {v1, v0, v14, v7, v11}, Lcom/flyersoft/moonreaderp/PrefMisc$101;->updateValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 2622
    invoke-direct {v1, v0, v13, v7, v11}, Lcom/flyersoft/moonreaderp/PrefMisc$101;->updateValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    move-object/from16 v2, v17

    .line 2623
    invoke-direct {v1, v0, v12, v2, v11}, Lcom/flyersoft/moonreaderp/PrefMisc$101;->updateValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 2624
    invoke-direct {v1, v0, v3, v2, v11}, Lcom/flyersoft/moonreaderp/PrefMisc$101;->updateValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 2625
    invoke-direct {v1, v0, v6, v2, v11}, Lcom/flyersoft/moonreaderp/PrefMisc$101;->updateValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 2626
    invoke-direct {v1, v0, v9, v2, v11}, Lcom/flyersoft/moonreaderp/PrefMisc$101;->updateValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 2627
    invoke-direct {v1, v0, v10, v2, v11}, Lcom/flyersoft/moonreaderp/PrefMisc$101;->updateValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_5

    :cond_6
    move-object/from16 v2, v16

    const/4 v7, 0x1

    .line 2629
    :try_start_a
    invoke-direct {v1, v0, v2, v7}, Lcom/flyersoft/moonreaderp/PrefMisc$101;->getValue(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Lcom/flyersoft/tools/T;->isFolder(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_7

    .line 2630
    const-string v11, "/sdcard/Books"

    sput-object v11, Lcom/flyersoft/tools/A;->default_book_folder:Ljava/lang/String;

    .line 2631
    invoke-static {v7}, Lcom/flyersoft/tools/A;->initPathParameters(Z)V

    .line 2632
    sget-object v11, Lcom/flyersoft/tools/A;->default_book_folder:Ljava/lang/String;

    invoke-direct {v1, v0, v2, v11, v7}, Lcom/flyersoft/moonreaderp/PrefMisc$101;->updateValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 2634
    :cond_7
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v11, Lcom/flyersoft/tools/A;->xml_files_folder:Ljava/lang/String;

    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7, v0}, Lcom/flyersoft/tools/T;->saveFileText(Ljava/lang/String;Ljava/lang/String;)Z
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_4

    goto/16 :goto_a

    :catch_4
    move-exception v0

    goto :goto_9

    :catch_5
    move-exception v0

    goto :goto_8

    :catch_6
    move-exception v0

    move-object/from16 v2, v16

    move-object/from16 v10, v18

    move-object/from16 v9, v19

    move-object/from16 v6, v20

    move-object/from16 v3, v23

    move-object/from16 v18, v11

    goto :goto_9

    :catch_7
    move-exception v0

    move-object/from16 v24, v3

    move-object/from16 v10, v18

    move-object/from16 v9, v19

    move-object/from16 v6, v20

    move-object/from16 v3, v23

    goto :goto_7

    :catch_8
    move-exception v0

    move-object/from16 v24, v3

    goto :goto_6

    :catch_9
    move-exception v0

    move-object/from16 v24, v3

    move-object/from16 v21, v6

    :goto_6
    move-object v3, v11

    move-object/from16 v10, v18

    move-object/from16 v9, v19

    move-object/from16 v6, v20

    :goto_7
    move-object/from16 v18, v2

    :goto_8
    move-object/from16 v2, v16

    .line 2637
    :goto_9
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 2638
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v7, "options1002"

    const/4 v8, 0x4

    invoke-virtual {v0, v7, v8}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 2639
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    move-object/from16 v8, v21

    const/4 v11, 0x0

    invoke-interface {v7, v8, v11}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    iget-boolean v8, v1, Lcom/flyersoft/moonreaderp/PrefMisc$101;->val$fromMain:Z

    const/4 v11, 0x1

    xor-int/2addr v8, v11

    .line 2640
    invoke-interface {v7, v5, v8}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    iget-boolean v7, v1, Lcom/flyersoft/moonreaderp/PrefMisc$101;->val$fromMain:Z

    .line 2641
    invoke-interface {v5, v4, v7}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    move-object/from16 v5, v24

    const/4 v7, 0x0

    .line 2642
    invoke-interface {v4, v5, v7}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    .line 2643
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    move-object/from16 v5, v18

    invoke-interface {v4, v5, v7, v8}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string v5, "immersive_fullscreen"

    .line 2644
    invoke-interface {v4, v5, v11}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 2645
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    invoke-virtual {v5, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v7, "deviceRandomID2"

    invoke-interface {v4, v7, v5}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    .line 2646
    invoke-interface {v4}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 2649
    const-string v4, "screensize"

    const-wide/16 v7, 0x0

    invoke-interface {v0, v4, v7, v8}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v4

    .line 2650
    sget-wide v7, Lcom/flyersoft/tools/A;->screensize:J

    cmp-long v11, v7, v4

    if-eqz v11, :cond_8

    .line 2651
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string v5, "fitCutout3"

    const/4 v11, 0x0

    .line 2652
    invoke-interface {v4, v5, v11}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string v5, "statusFontSize"

    sget v7, Lcom/flyersoft/tools/A;->statusFontSize:I

    .line 2653
    invoke-interface {v4, v5, v7}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string v5, "statusMargin"

    sget v7, Lcom/flyersoft/tools/A;->statusMargin:I

    .line 2654
    invoke-interface {v4, v5, v7}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string v5, "shelfFontSize5"

    sget v7, Lcom/flyersoft/tools/A;->shelfFontSize:I

    .line 2655
    invoke-interface {v4, v5, v7}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string v5, "shelfCoverSize6"

    sget v7, Lcom/flyersoft/tools/A;->shelfCoverSize:I

    .line 2656
    invoke-interface {v4, v5, v7}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string v5, "netCoverSize5"

    sget v7, Lcom/flyersoft/tools/A;->netCoverSize:I

    .line 2657
    invoke-interface {v4, v5, v7}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string v5, "fileCoverSize5"

    sget v7, Lcom/flyersoft/tools/A;->fileCoverSize:I

    .line 2658
    invoke-interface {v4, v5, v7}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    invoke-interface {v4}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 2661
    :cond_8
    invoke-static {}, Lcom/flyersoft/tools/A;->isPro()Z

    move-result v4

    if-eqz v4, :cond_9

    sget-object v4, Lcom/flyersoft/moonreaderp/PrefMisc;->selectedBackup:Ljava/lang/String;

    const-string v5, "mrstd"

    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    const/4 v11, -0x1

    if-eq v4, v11, :cond_9

    .line 2662
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    sget-boolean v5, Lcom/flyersoft/tools/A;->mult_touch:Z

    .line 2663
    invoke-interface {v4, v14, v5}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    sget-boolean v5, Lcom/flyersoft/tools/A;->needPasswordProtect:Z

    .line 2664
    invoke-interface {v4, v13, v5}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    sget v5, Lcom/flyersoft/tools/A;->doShakePhone:I

    .line 2665
    invoke-interface {v4, v12, v5}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    sget v5, Lcom/flyersoft/tools/A;->doHeadsetKey:I

    .line 2666
    invoke-interface {v4, v3, v5}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    sget v5, Lcom/flyersoft/tools/A;->doMediaPlayPause:I

    .line 2667
    invoke-interface {v4, v6, v5}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    sget v5, Lcom/flyersoft/tools/A;->doMediaPlayNext:I

    .line 2668
    invoke-interface {v4, v9, v5}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    sget v5, Lcom/flyersoft/tools/A;->doMediaPlayPrevious:I

    .line 2669
    invoke-interface {v4, v10, v5}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    invoke-interface {v4}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 2671
    :cond_9
    invoke-static {}, Lcom/flyersoft/tools/A;->isPro()Z

    move-result v4

    if-nez v4, :cond_a

    sget-object v4, Lcom/flyersoft/moonreaderp/PrefMisc;->selectedBackup:Ljava/lang/String;

    const-string v5, "mrpro"

    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    const/4 v11, -0x1

    if-eq v4, v11, :cond_a

    .line 2672
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const/4 v11, 0x0

    invoke-interface {v4, v14, v11}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    .line 2673
    invoke-interface {v4, v13, v11}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    sget v5, Lcom/flyersoft/tools/A;->doShakePhone:I

    .line 2674
    invoke-interface {v4, v12, v5}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const/16 v5, 0xf

    .line 2675
    invoke-interface {v4, v3, v5}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    .line 2676
    invoke-interface {v3, v6, v5}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    .line 2677
    invoke-interface {v3, v9, v5}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    .line 2678
    invoke-interface {v3, v10, v5}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 2680
    :cond_a
    sget-object v3, Lcom/flyersoft/tools/A;->default_book_folder:Ljava/lang/String;

    invoke-static {v3}, Lcom/flyersoft/tools/T;->isFolder(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_b

    .line 2681
    const-string v3, "/sdcard/Books"

    sput-object v3, Lcom/flyersoft/tools/A;->default_book_folder:Ljava/lang/String;

    const/16 v22, 0x1

    .line 2682
    invoke-static/range {v22 .. v22}, Lcom/flyersoft/tools/A;->initPathParameters(Z)V

    .line 2683
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    sget-object v3, Lcom/flyersoft/tools/A;->default_book_folder:Ljava/lang/String;

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 2685
    :cond_b
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/A;->LoadOptions(Landroid/content/Context;)V

    .line 2688
    :goto_a
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/flyersoft/tools/A;->xml_files_folder:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/dropbox.xml"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->deleteFile(Ljava/lang/String;)Z

    move-object/from16 v2, p2

    .line 2689
    invoke-direct {v1, v2}, Lcom/flyersoft/moonreaderp/PrefMisc$101;->deleteUnusedShare_PrefFiles(Ljava/util/ArrayList;)V

    .line 2690
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/PrefMisc$101;->val$handler:Landroid/os/Handler;

    const/16 v2, 0x64

    invoke-virtual {v0, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_b

    .line 2691
    :cond_c
    iget-object v2, v1, Lcom/flyersoft/moonreaderp/PrefMisc$101;->val$handler:Landroid/os/Handler;

    if-eqz v2, :cond_d

    const/4 v10, 0x0

    .line 2692
    invoke-virtual {v2, v10, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :cond_d
    :goto_b
    return-void
.end method
