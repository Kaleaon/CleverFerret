.class Lcom/flyersoft/moonreaderp/ActivityMain$23;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->openDownloadedBook(Landroid/os/Message;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

.field final synthetic val$bookFile:Ljava/lang/String;

.field final synthetic val$id:I


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;ILjava/lang/String;)V
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

    .line 2652
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$23;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$23;->val$id:I

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$23;->val$bookFile:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 2655
    iget p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$23;->val$id:I

    if-eqz p1, :cond_0

    .line 2656
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$23;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const-string p2, "notification"

    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/app/NotificationManager;

    .line 2657
    iget p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$23;->val$id:I

    invoke-virtual {p1, p2}, Landroid/app/NotificationManager;->cancel(I)V

    .line 2659
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$23;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$23;->val$bookFile:Ljava/lang/String;

    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->openFile(Ljava/lang/String;)V

    return-void
.end method
