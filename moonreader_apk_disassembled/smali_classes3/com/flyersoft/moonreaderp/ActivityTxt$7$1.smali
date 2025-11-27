.class Lcom/flyersoft/moonreaderp/ActivityTxt$7$1;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt$7;->handleMessage(Landroid/os/Message;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$7;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt$7;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 1431
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$7$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$7;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1433
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$7$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$7;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->restartReaderToTxt()V

    return-void
.end method
