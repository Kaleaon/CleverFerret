.class Lcom/flyersoft/moonreaderp/ActivityTxt$201$1;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


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

    .line 18896
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$201;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 1

    .line 18899
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$201;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mpdfSetImmersiveMode(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V

    return-void
.end method
