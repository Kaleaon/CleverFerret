.class Lcom/flyersoft/moonreaderp/ActivityTxt$178$2;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt$178;->restartForFont()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$178;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt$178;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 17920
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$178$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$178;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 17922
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$178$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$178;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt$178;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->saveLastPostion(Z)V

    .line 17923
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$178$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$178;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt$178;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->restartReaderToTxt()V

    return-void
.end method
