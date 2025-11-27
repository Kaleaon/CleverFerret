.class Lcom/flyersoft/moonreaderp/ActivityMain$144;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->renameBookFile(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

.field final synthetic val$edit:Landroid/widget/EditText;

.field final synthetic val$fullname:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;Landroid/widget/EditText;Ljava/lang/String;)V
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

    .line 13635
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$144;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$144;->val$edit:Landroid/widget/EditText;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$144;->val$fullname:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    .line 13637
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$144;->val$edit:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    .line 13638
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$144;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->isWebDav()Z

    move-result p2

    if-eqz p2, :cond_0

    .line 13639
    invoke-static {p1}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 13640
    :cond_0
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$144;->val$fullname:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "/"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 13642
    :try_start_0
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$144;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->isLocal()Z

    move-result p2

    const/4 v0, 0x0

    if-nez p2, :cond_1

    .line 13643
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$144;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$144;->val$fullname:Ljava/lang/String;

    invoke-static {p2, v1, p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mrenameCloudFile(Lcom/flyersoft/moonreaderp/ActivityMain;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 13645
    :cond_1
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$144;->val$fullname:Ljava/lang/String;

    const/4 v1, 0x1

    invoke-static {p2, p1, v1}, Lcom/flyersoft/tools/T;->renameFile(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result p2

    if-eqz p2, :cond_2

    .line 13646
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$144;->val$fullname:Ljava/lang/String;

    invoke-static {p2, p1}, Lcom/flyersoft/tools/A;->updateToNewFilename(Ljava/lang/String;Ljava/lang/String;)V

    .line 13647
    sput-object p1, Lcom/flyersoft/moonreaderp/ActivityMain;->forceMyFilesScrollToFilename:Ljava/lang/String;

    .line 13648
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$144;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget-object p2, Lcom/flyersoft/tools/A;->lastPath:Ljava/lang/String;

    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->showFileList(Ljava/lang/String;)V

    goto :goto_0

    .line 13650
    :cond_2
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$144;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$144;->val$fullname:Ljava/lang/String;

    invoke-virtual {p1, p2, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->ifRequestGrantSD(Ljava/lang/String;Z)Z

    .line 13652
    :goto_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$144;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->show_select_state(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 13654
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return-void
.end method
