.class Lcom/flyersoft/moonreaderp/PrefChapters$20$2;
.super Ljava/lang/Object;
.source "PrefChapters.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefFilePick$OnGetFile;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefChapters$20;->onClick(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefChapters$20;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefChapters$20;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 1851
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$20$2;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters$20;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGetFile(Ljava/lang/String;)V
    .locals 5

    .line 1854
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$20$2;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters$20;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters$20;->val$bookFile:Ljava/lang/String;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$20$2;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters$20;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefChapters$20;->val$annots:Ljava/util/ArrayList;

    invoke-static {v0, p1, v1}, Lcom/flyersoft/tools/BookDb;->exportNotesToFile(Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 1855
    invoke-static {p1}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/tools/A;->share_export_path:Ljava/lang/String;

    .line 1856
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$20$2;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters$20;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters$20;->val$context:Landroid/content/Context;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefChapters$20$2;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters$20;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/PrefChapters$20;->val$context:Landroid/content/Context;

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->export_success:I

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1, v1}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;I)V

    return-void

    .line 1858
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$20$2;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters$20;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$20;->val$context:Landroid/content/Context;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$20$2;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters$20;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters$20;->val$context:Landroid/content/Context;

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->export_failed:I

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0, v1}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;I)V

    return-void
.end method
