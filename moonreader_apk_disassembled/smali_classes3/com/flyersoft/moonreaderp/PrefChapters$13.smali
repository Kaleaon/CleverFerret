.class Lcom/flyersoft/moonreaderp/PrefChapters$13;
.super Ljava/lang/Object;
.source "PrefChapters.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefChapters;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

.field final synthetic val$cb4:Landroid/widget/CheckBox;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefChapters;Landroid/widget/CheckBox;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 962
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$13;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefChapters$13;->val$cb4:Landroid/widget/CheckBox;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 965
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$13;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefChapters;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$13;->val$cb4:Landroid/widget/CheckBox;

    invoke-static {p1, v0}, Lcom/flyersoft/components/Readwise;->showOption(Landroid/content/Context;Landroid/widget/CheckBox;)V

    return-void
.end method
