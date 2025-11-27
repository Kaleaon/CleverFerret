.class Lcom/flyersoft/moonreaderp/PrefSearch$2;
.super Landroid/os/Handler;
.source "PrefSearch.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PrefSearch;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefSearch;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefSearch;Landroid/os/Looper;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 136
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSearch$2;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 1

    .line 139
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSearch$2;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefSearch;->et:Lcom/flyersoft/views/ClearableEditText;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSearch$2;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefSearch;->senderSearchKey:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/flyersoft/views/ClearableEditText;->setText(Ljava/lang/CharSequence;)V

    .line 140
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSearch$2;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    iget-object v0, p1, Lcom/flyersoft/moonreaderp/PrefSearch;->searchB:Landroid/widget/ImageButton;

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefSearch;->onClick(Landroid/view/View;)V

    return-void
.end method
