.class Lcom/flyersoft/moonreaderp/PrefEditBookmark$3;
.super Ljava/lang/Object;
.source "PrefEditBookmark.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefEditBookmark;->initView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefEditBookmark;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefEditBookmark;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 81
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditBookmark$3;->this$0:Lcom/flyersoft/moonreaderp/PrefEditBookmark;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 1

    .line 84
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditBookmark$3;->this$0:Lcom/flyersoft/moonreaderp/PrefEditBookmark;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefEditBookmark;->colorCb:Landroid/widget/CheckBox;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    if-eqz p2, :cond_0

    .line 86
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditBookmark$3;->this$0:Lcom/flyersoft/moonreaderp/PrefEditBookmark;

    iget-object p2, p1, Lcom/flyersoft/moonreaderp/PrefEditBookmark;->colorLay:Landroid/view/View;

    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/PrefEditBookmark;->onClick(Landroid/view/View;)V

    .line 87
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditBookmark$3;->this$0:Lcom/flyersoft/moonreaderp/PrefEditBookmark;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefEditBookmark;->colorLay:Landroid/view/View;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    :cond_0
    return-void
.end method
