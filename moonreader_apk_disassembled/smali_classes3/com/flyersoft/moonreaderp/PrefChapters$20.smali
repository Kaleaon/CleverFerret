.class Lcom/flyersoft/moonreaderp/PrefChapters$20;
.super Ljava/lang/Object;
.source "PrefChapters.java"

# interfaces
.implements Lcom/flyersoft/components/MyMenu$MenuItemClick;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefChapters;->doShare(Landroid/content/Context;Ljava/lang/String;Ljava/util/ArrayList;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$annots:Ljava/util/ArrayList;

.field final synthetic val$bookFile:Ljava/lang/String;

.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$fromMain:Z


# direct methods
.method constructor <init>(ZLjava/lang/String;Landroid/content/Context;Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1827
    iput-boolean p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$20;->val$fromMain:Z

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefChapters$20;->val$bookFile:Ljava/lang/String;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PrefChapters$20;->val$context:Landroid/content/Context;

    iput-object p4, p0, Lcom/flyersoft/moonreaderp/PrefChapters$20;->val$annots:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(I)V
    .locals 5

    .line 1829
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$20;->val$fromMain:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$20;->val$bookFile:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string v1, ".pdf"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1830
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$20;->val$context:Landroid/content/Context;

    const-string v0, "For Pdf document, please open it to export/import highlights/notes."

    invoke-static {p1, v0}, Lcom/flyersoft/tools/T;->showAlertText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    return-void

    :cond_0
    const/4 v0, 0x1

    if-eqz p1, :cond_6

    if-eq p1, v0, :cond_6

    const/4 v1, 0x2

    .line 1834
    const-string v2, "*.mrexpt"

    const-string v3, ".mrexpt"

    const-string v4, "/"

    if-eq p1, v1, :cond_4

    const/4 v1, 0x3

    if-eq p1, v1, :cond_1

    goto/16 :goto_1

    .line 1871
    :cond_1
    invoke-static {v0}, Lcom/flyersoft/tools/A;->permissionOk(Z)Z

    move-result p1

    if-nez p1, :cond_2

    goto/16 :goto_2

    .line 1873
    :cond_2
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$20;->val$bookFile:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$20;->val$bookFile:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getOnlyFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1874
    invoke-static {p1}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 1875
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v0, Lcom/flyersoft/tools/A;->share_export_path:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$20;->val$bookFile:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getOnlyFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1876
    :cond_3
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefFilePick;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$20;->val$context:Landroid/content/Context;

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->import_ebooks:I

    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Lcom/flyersoft/moonreaderp/PrefChapters$20$4;

    invoke-direct {v4, p0}, Lcom/flyersoft/moonreaderp/PrefChapters$20$4;-><init>(Lcom/flyersoft/moonreaderp/PrefChapters$20;)V

    invoke-direct {v0, v1, v3, p1, v4}, Lcom/flyersoft/moonreaderp/PrefFilePick;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/flyersoft/moonreaderp/PrefFilePick$OnGetFile;)V

    new-instance p1, Lcom/flyersoft/moonreaderp/PrefChapters$20$3;

    invoke-direct {p1, p0}, Lcom/flyersoft/moonreaderp/PrefChapters$20$3;-><init>(Lcom/flyersoft/moonreaderp/PrefChapters$20;)V

    .line 1909
    invoke-virtual {v0, p1}, Lcom/flyersoft/moonreaderp/PrefFilePick;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)Lcom/flyersoft/moonreaderp/PrefFilePick;

    move-result-object p1

    .line 1915
    invoke-virtual {p1, v2}, Lcom/flyersoft/moonreaderp/PrefFilePick;->setFilter(Ljava/lang/String;)Lcom/flyersoft/moonreaderp/PrefFilePick;

    move-result-object p1

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefFilePick;->show()Lcom/flyersoft/moonreaderp/PrefFilePick;

    goto/16 :goto_1

    .line 1847
    :cond_4
    invoke-static {v0}, Lcom/flyersoft/tools/A;->permissionOk(Z)Z

    move-result p1

    if-nez p1, :cond_5

    goto/16 :goto_2

    .line 1849
    :cond_5
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$20;->val$annots:Ljava/util/ArrayList;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result p1

    if-nez p1, :cond_8

    .line 1850
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v0, Lcom/flyersoft/tools/A;->share_export_path:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$20;->val$bookFile:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getOnlyFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1851
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefFilePick;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$20;->val$context:Landroid/content/Context;

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->export:I

    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Lcom/flyersoft/moonreaderp/PrefChapters$20$2;

    invoke-direct {v4, p0}, Lcom/flyersoft/moonreaderp/PrefChapters$20$2;-><init>(Lcom/flyersoft/moonreaderp/PrefChapters$20;)V

    invoke-direct {v0, v1, v3, p1, v4}, Lcom/flyersoft/moonreaderp/PrefFilePick;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/flyersoft/moonreaderp/PrefFilePick$OnGetFile;)V

    new-instance p1, Lcom/flyersoft/moonreaderp/PrefChapters$20$1;

    invoke-direct {p1, p0}, Lcom/flyersoft/moonreaderp/PrefChapters$20$1;-><init>(Lcom/flyersoft/moonreaderp/PrefChapters$20;)V

    .line 1860
    invoke-virtual {v0, p1}, Lcom/flyersoft/moonreaderp/PrefFilePick;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)Lcom/flyersoft/moonreaderp/PrefFilePick;

    move-result-object p1

    .line 1866
    invoke-virtual {p1, v2}, Lcom/flyersoft/moonreaderp/PrefFilePick;->setFilter(Ljava/lang/String;)Lcom/flyersoft/moonreaderp/PrefFilePick;

    move-result-object p1

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefFilePick;->show()Lcom/flyersoft/moonreaderp/PrefFilePick;

    goto :goto_1

    .line 1837
    :cond_6
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$20;->val$annots:Ljava/util/ArrayList;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v1

    if-nez v1, :cond_8

    .line 1839
    :try_start_0
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$20;->val$bookFile:Ljava/lang/String;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefChapters$20;->val$annots:Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefChapters$20;->val$context:Landroid/content/Context;

    invoke-static {v1, v2, v3}, Lcom/flyersoft/moonreaderp/PrefChapters;->-$$Nest$smcreateShareContent(Ljava/lang/String;Ljava/util/ArrayList;Landroid/content/Context;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 1840
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefChapters$20;->val$context:Landroid/content/Context;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefChapters$20;->val$bookFile:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    if-ne p1, v0, :cond_7

    goto :goto_0

    :cond_7
    const/4 v0, 0x0

    :goto_0
    iget-boolean p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$20;->val$fromMain:Z

    invoke-static {v2, v3, v1, v0, p1}, Lcom/flyersoft/moonreaderp/PrefChapters;->shareContent(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception p1

    .line 1842
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 1918
    :cond_8
    :goto_1
    sget-object p1, Lcom/flyersoft/moonreaderp/PrefChapters;->selfPref:Lcom/flyersoft/moonreaderp/PrefChapters;

    if-eqz p1, :cond_9

    .line 1919
    sget-object p1, Lcom/flyersoft/moonreaderp/PrefChapters;->selfPref:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefChapters;->-$$Nest$mhideSystemNavigation(Lcom/flyersoft/moonreaderp/PrefChapters;)V

    :cond_9
    :goto_2
    return-void
.end method
