.class Lcom/flyersoft/moonreaderp/PrefMisc$80;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->createNamesReplacementView(Landroid/content/Context;Ljava/lang/String;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$base:Landroid/widget/LinearLayout;

.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$one:Lcom/flyersoft/views/RoundButton;


# direct methods
.method constructor <init>(Lcom/flyersoft/views/RoundButton;Landroid/content/Context;Landroid/widget/LinearLayout;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1963
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$80;->val$one:Lcom/flyersoft/views/RoundButton;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$80;->val$context:Landroid/content/Context;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PrefMisc$80;->val$base:Landroid/widget/LinearLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4

    .line 1966
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$80;->val$one:Lcom/flyersoft/views/RoundButton;

    invoke-virtual {p1}, Lcom/flyersoft/views/RoundButton;->isChecked()Z

    move-result p1

    if-eqz p1, :cond_0

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v0, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ".replacement"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    const-string p1, "names.replacement"

    .line 1967
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1968
    invoke-static {v0}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "/sdcard/Books"

    invoke-static {v1}, Lcom/flyersoft/tools/T;->isFolder(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1969
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "/sdcard/"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1970
    :cond_1
    new-instance p1, Lcom/flyersoft/moonreaderp/PrefFilePick;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$80;->val$context:Landroid/content/Context;

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->import_ebooks:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/flyersoft/moonreaderp/PrefMisc$80$1;

    invoke-direct {v3, p0}, Lcom/flyersoft/moonreaderp/PrefMisc$80$1;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc$80;)V

    invoke-direct {p1, v1, v2, v0, v3}, Lcom/flyersoft/moonreaderp/PrefFilePick;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/flyersoft/moonreaderp/PrefFilePick$OnGetFile;)V

    const-string v0, "*.replacement"

    .line 2004
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefFilePick;->setFilter(Ljava/lang/String;)Lcom/flyersoft/moonreaderp/PrefFilePick;

    move-result-object p1

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefFilePick;->show()Lcom/flyersoft/moonreaderp/PrefFilePick;

    return-void
.end method
