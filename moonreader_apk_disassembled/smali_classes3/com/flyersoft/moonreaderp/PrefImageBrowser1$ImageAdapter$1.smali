.class Lcom/flyersoft/moonreaderp/PrefImageBrowser1$ImageAdapter$1;
.super Ljava/lang/Object;
.source "PrefImageBrowser1.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PrefImageBrowser1$ImageAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/PrefImageBrowser1$ImageAdapter;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefImageBrowser1$ImageAdapter;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 264
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$ImageAdapter$1;->this$1:Lcom/flyersoft/moonreaderp/PrefImageBrowser1$ImageAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 267
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$ImageAdapter$1;->this$1:Lcom/flyersoft/moonreaderp/PrefImageBrowser1$ImageAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$ImageAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefImageBrowser1;

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {v0, p1, v1}, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->-$$Nest$mshowOverflowMenu(Lcom/flyersoft/moonreaderp/PrefImageBrowser1;Landroid/view/View;I)V

    return-void
.end method
