.class Lcom/flyersoft/moonreaderp/ActivityTxt$201$8;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt$201;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$201;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt$201;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 18998
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201$8;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$201;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 19000
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201$8;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$201;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 p2, 0x0

    invoke-static {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mpdfSetImmersiveMode(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V

    return-void
.end method
