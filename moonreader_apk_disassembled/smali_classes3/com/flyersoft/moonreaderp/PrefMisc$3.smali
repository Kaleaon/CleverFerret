.class Lcom/flyersoft/moonreaderp/PrefMisc$3;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->loadSettings()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefMisc;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefMisc;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 247
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$3;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 1

    .line 249
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$3;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v0, Lcom/flyersoft/moonreaderp/R$id;->disableCSS:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    if-eqz p2, :cond_1

    .line 252
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$3;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefMisc;->-$$Nest$mdo_SetCSS(Lcom/flyersoft/moonreaderp/PrefMisc;)V

    :cond_1
    :goto_0
    return-void
.end method
