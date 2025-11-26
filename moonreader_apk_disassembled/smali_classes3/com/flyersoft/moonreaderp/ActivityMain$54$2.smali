.class Lcom/flyersoft/moonreaderp/ActivityMain$54$2;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain$54;->handleMessage(Landroid/os/Message;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityMain$54;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain$54;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 5048
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$54;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 5051
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$54;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$54;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->importedBookFiles:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->openFile(Ljava/lang/String;)V

    return-void
.end method
