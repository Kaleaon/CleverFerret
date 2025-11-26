.class Lcom/flyersoft/moonreaderp/ActivityMain$6;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->showOpenPdfAttachemt(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

.field final synthetic val$filename:Ljava/lang/String;


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

    .line 772
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$6;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$6;->val$filename:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 775
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$6;->val$filename:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "2"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$6;->val$filename:Ljava/lang/String;

    const/4 v0, 0x1

    invoke-static {p1, p2, v0}, Lcom/flyersoft/tools/T;->moveFile(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 776
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$6;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$6;->val$filename:Ljava/lang/String;

    invoke-static {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mopenAttachmentFile(Lcom/flyersoft/moonreaderp/ActivityMain;Ljava/lang/String;)V

    return-void
.end method
