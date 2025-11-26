.class Lcom/flyersoft/moonreaderp/PrefShelf$19;
.super Ljava/lang/Object;
.source "PrefShelf.java"

# interfaces
.implements Landroid/widget/RadioGroup$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefShelf;->createWoodyResView()Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefShelf;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefShelf;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 789
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$19;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/RadioGroup;I)V
    .locals 2

    .line 792
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$19;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    iget-object v0, p1, Lcom/flyersoft/moonreaderp/PrefShelf;->woodyLay:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->r0:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getId()I

    move-result v0

    if-ne p2, v0, :cond_0

    const/4 p2, 0x1

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :goto_0
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    iput-object p2, p1, Lcom/flyersoft/moonreaderp/PrefShelf;->woodyDaySelected:Ljava/lang/Boolean;

    .line 793
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$19;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefShelf;->-$$Nest$msetWoodySelect(Lcom/flyersoft/moonreaderp/PrefShelf;)V

    .line 794
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$19;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefShelf;->-$$Nest$mloadCustShelfImage(Lcom/flyersoft/moonreaderp/PrefShelf;)V

    return-void
.end method
