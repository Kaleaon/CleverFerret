.class Lcom/flyersoft/moonreaderp/PrefMisc$69;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->createTtsFiltersView(Landroid/content/Context;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$base:Landroid/widget/LinearLayout;

.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Landroid/content/Context;Landroid/widget/LinearLayout;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1762
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$69;->val$context:Landroid/content/Context;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$69;->val$base:Landroid/widget/LinearLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4

    .line 1765
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v0, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v0, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getOnlyFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ".ttsfilter"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1766
    invoke-static {p1}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1767
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v1, "/sdcard/"

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v1, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->getOnlyFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1768
    :cond_0
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefFilePick;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$69;->val$context:Landroid/content/Context;

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->import_ebooks:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/flyersoft/moonreaderp/PrefMisc$69$1;

    invoke-direct {v3, p0}, Lcom/flyersoft/moonreaderp/PrefMisc$69$1;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc$69;)V

    invoke-direct {v0, v1, v2, p1, v3}, Lcom/flyersoft/moonreaderp/PrefFilePick;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/flyersoft/moonreaderp/PrefFilePick$OnGetFile;)V

    const-string p1, "*.ttsfilter"

    .line 1801
    invoke-virtual {v0, p1}, Lcom/flyersoft/moonreaderp/PrefFilePick;->setFilter(Ljava/lang/String;)Lcom/flyersoft/moonreaderp/PrefFilePick;

    move-result-object p1

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefFilePick;->show()Lcom/flyersoft/moonreaderp/PrefFilePick;

    return-void
.end method
