.class Lcom/flyersoft/moonreaderp/PrefMisc$23$1;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefColorPick$OnSaveColor;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc$23;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/PrefMisc$23;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefMisc$23;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 885
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$23$1;->this$1:Lcom/flyersoft/moonreaderp/PrefMisc$23;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getColor(I)V
    .locals 1

    .line 887
    sput p1, Lcom/flyersoft/tools/A;->linkColor:I

    .line 888
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$23$1;->this$1:Lcom/flyersoft/moonreaderp/PrefMisc$23;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefMisc$23;->val$linkView:Landroid/view/View;

    sget v0, Lcom/flyersoft/tools/A;->linkColor:I

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    return-void
.end method
