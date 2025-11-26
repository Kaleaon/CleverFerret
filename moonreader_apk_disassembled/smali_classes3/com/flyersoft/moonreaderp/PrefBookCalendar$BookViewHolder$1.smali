.class Lcom/flyersoft/moonreaderp/PrefBookCalendar$BookViewHolder$1;
.super Ljava/lang/Object;
.source "PrefBookCalendar.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PrefBookCalendar$BookViewHolder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/PrefBookCalendar$BookViewHolder;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefBookCalendar$BookViewHolder;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 571
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$BookViewHolder$1;->this$1:Lcom/flyersoft/moonreaderp/PrefBookCalendar$BookViewHolder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 573
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$BookViewHolder$1;->this$1:Lcom/flyersoft/moonreaderp/PrefBookCalendar$BookViewHolder;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$BookViewHolder;->this$0:Lcom/flyersoft/moonreaderp/PrefBookCalendar;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->con:Landroid/content/Context;

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->book_information:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$BookViewHolder$1;->this$1:Lcom/flyersoft/moonreaderp/PrefBookCalendar$BookViewHolder;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefBookCalendar$BookViewHolder;->this$0:Lcom/flyersoft/moonreaderp/PrefBookCalendar;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->con:Landroid/content/Context;

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->delete:I

    .line 574
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    .line 575
    new-instance v1, Lcom/flyersoft/components/MyMenu;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$BookViewHolder$1;->this$1:Lcom/flyersoft/moonreaderp/PrefBookCalendar$BookViewHolder;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefBookCalendar$BookViewHolder;->this$0:Lcom/flyersoft/moonreaderp/PrefBookCalendar;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->con:Landroid/content/Context;

    invoke-direct {v1, v2}, Lcom/flyersoft/components/MyMenu;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, p1}, Lcom/flyersoft/components/MyMenu;->setAnchor(Landroid/view/View;)Lcom/flyersoft/components/MyMenu;

    move-result-object v1

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefBookCalendar$BookViewHolder$1$1;

    invoke-direct {v2, p0, p1}, Lcom/flyersoft/moonreaderp/PrefBookCalendar$BookViewHolder$1$1;-><init>(Lcom/flyersoft/moonreaderp/PrefBookCalendar$BookViewHolder$1;Landroid/view/View;)V

    invoke-virtual {v1, v0, v2}, Lcom/flyersoft/components/MyMenu;->setItems([Ljava/lang/CharSequence;Lcom/flyersoft/components/MyMenu$MenuItemClick;)Lcom/flyersoft/components/MyMenu;

    move-result-object p1

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$BookViewHolder$1;->this$1:Lcom/flyersoft/moonreaderp/PrefBookCalendar$BookViewHolder;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$BookViewHolder;->this$0:Lcom/flyersoft/moonreaderp/PrefBookCalendar;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->lay:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->rv:I

    .line 603
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/flyersoft/components/MyMenu;->setBuilderAnchor(Landroid/view/View;)Lcom/flyersoft/components/MyMenu;

    move-result-object p1

    invoke-virtual {p1}, Lcom/flyersoft/components/MyMenu;->show()V

    return-void
.end method
