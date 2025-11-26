.class Lcom/flyersoft/moonreaderp/ActivityMain$91;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->verifyShelfBook(Landroid/content/Context;Lcom/flyersoft/tools/BookDb$BookInfo;Ljava/util/ArrayList;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

.field final synthetic val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

.field final synthetic val$openErrDlg:Lcom/flyersoft/components/MyDialog;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;Lcom/flyersoft/components/MyDialog;Lcom/flyersoft/tools/BookDb$BookInfo;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 8946
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$91;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$91;->val$openErrDlg:Lcom/flyersoft/components/MyDialog;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$91;->val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 7

    .line 8949
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$91;->val$openErrDlg:Lcom/flyersoft/components/MyDialog;

    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->dismiss()V

    .line 8950
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    sget v0, Lcom/flyersoft/tools/A;->syncType:I

    invoke-static {v0}, Lcom/flyersoft/components/cloud/Cloud;->getWebBookPath(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$91;->val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v0, v0, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 8951
    sget v0, Lcom/flyersoft/tools/A;->syncType:I

    invoke-static {v0}, Lcom/flyersoft/components/cloud/Cloud;->instance(I)Lcom/flyersoft/components/cloud/Cloud;

    move-result-object v1

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$91;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/components/cloud/Cloud;->FileList([Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v3

    sget-object v4, Lcom/flyersoft/tools/A;->cloud_cache_path:Ljava/lang/String;

    new-instance v6, Lcom/flyersoft/moonreaderp/ActivityMain$91$1;

    invoke-direct {v6, p0, p1}, Lcom/flyersoft/moonreaderp/ActivityMain$91$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$91;Ljava/lang/String;)V

    const/4 v5, 0x1

    invoke-virtual/range {v1 .. v6}, Lcom/flyersoft/components/cloud/Cloud;->download(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;ZLcom/flyersoft/tools/T$OnResult;)V

    return-void
.end method
