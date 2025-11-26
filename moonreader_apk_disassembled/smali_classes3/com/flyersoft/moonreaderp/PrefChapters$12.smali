.class Lcom/flyersoft/moonreaderp/PrefChapters$12;
.super Ljava/lang/Object;
.source "PrefChapters.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


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

    .line 952
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$12;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefChapters$12;->val$cb4:Landroid/widget/CheckBox;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 0

    if-eqz p2, :cond_0

    .line 955
    sget-object p2, Lcom/flyersoft/tools/A;->readWiseToken:Ljava/lang/String;

    invoke-static {p2}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_0

    const/4 p2, 0x0

    .line 956
    invoke-virtual {p1, p2}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 957
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$12;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefChapters;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefChapters$12;->val$cb4:Landroid/widget/CheckBox;

    invoke-static {p1, p2}, Lcom/flyersoft/components/Readwise;->showOption(Landroid/content/Context;Landroid/widget/CheckBox;)V

    :cond_0
    return-void
.end method
