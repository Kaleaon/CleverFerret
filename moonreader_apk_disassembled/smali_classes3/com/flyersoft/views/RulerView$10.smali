.class Lcom/flyersoft/views/RulerView$10;
.super Ljava/lang/Object;
.source "RulerView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/views/RulerView;->showRulerOptions(Landroid/content/Context;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$con:Landroid/content/Context;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 674
    iput-object p1, p0, Lcom/flyersoft/views/RulerView$10;->val$con:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 6

    .line 677
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefColorPick;

    iget-object v1, p0, Lcom/flyersoft/views/RulerView$10;->val$con:Landroid/content/Context;

    sget p1, Lcom/flyersoft/moonreaderp/R$string;->highlight_color:I

    invoke-virtual {v1, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    sget v4, Lcom/flyersoft/views/RulerView;->rulerColor:I

    new-instance v5, Lcom/flyersoft/views/RulerView$10$1;

    invoke-direct {v5, p0}, Lcom/flyersoft/views/RulerView$10$1;-><init>(Lcom/flyersoft/views/RulerView$10;)V

    const/4 v3, 0x1

    invoke-direct/range {v0 .. v5}, Lcom/flyersoft/moonreaderp/PrefColorPick;-><init>(Landroid/content/Context;Ljava/lang/String;ZILcom/flyersoft/moonreaderp/PrefColorPick$OnSaveColor;)V

    .line 686
    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefColorPick;->show()V

    return-void
.end method
