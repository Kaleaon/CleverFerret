.class Lcom/flyersoft/moonreaderp/ActivityMain$138;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Lcom/flyersoft/components/cloud/Cloud$AfterLogin;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->validateCloud(Ljava/lang/String;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

.field final synthetic val$path:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 13168
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$138;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$138;->val$path:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterLogin(ZLjava/lang/String;)V
    .locals 1

    if-eqz p1, :cond_1

    .line 13172
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$138;->val$path:Ljava/lang/String;

    if-eqz p1, :cond_0

    .line 13173
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$138;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const-string p2, "/"

    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->showCloudFolder(Ljava/lang/String;)V

    :cond_0
    return-void

    :cond_1
    const/4 p1, 0x0

    .line 13175
    sput p1, Lcom/flyersoft/tools/A;->files_from:I

    .line 13176
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$138;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/4 p2, 0x1

    sget v0, Lcom/flyersoft/tools/A;->files_from:I

    invoke-virtual {p1, p2, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateFilesCloudIndicator(ZI)V

    return-void
.end method
