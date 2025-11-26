.class Lcom/flyersoft/moonreaderp/PrefShareText$SliderAdapter;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "PrefShareText.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PrefShareText;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "SliderAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Lcom/flyersoft/moonreaderp/PrefShareText$SliderCard;",
        ">;"
    }
.end annotation


# instance fields
.field private final listener:Landroid/view/View$OnClickListener;

.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefShareText;


# direct methods
.method static bridge synthetic -$$Nest$fgetlistener(Lcom/flyersoft/moonreaderp/PrefShareText$SliderAdapter;)Landroid/view/View$OnClickListener;
    .locals 0

    iget-object p0, p0, Lcom/flyersoft/moonreaderp/PrefShareText$SliderAdapter;->listener:Landroid/view/View$OnClickListener;

    return-object p0
.end method

.method public constructor <init>(Lcom/flyersoft/moonreaderp/PrefShareText;Landroid/view/View$OnClickListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 350
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShareText$SliderAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefShareText;

    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    .line 351
    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefShareText$SliderAdapter;->listener:Landroid/view/View$OnClickListener;

    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    const/4 v0, 0x4

    return v0
.end method

.method public bridge synthetic onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 348
    check-cast p1, Lcom/flyersoft/moonreaderp/PrefShareText$SliderCard;

    invoke-virtual {p0, p1, p2}, Lcom/flyersoft/moonreaderp/PrefShareText$SliderAdapter;->onBindViewHolder(Lcom/flyersoft/moonreaderp/PrefShareText$SliderCard;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/flyersoft/moonreaderp/PrefShareText$SliderCard;I)V
    .locals 0

    .line 371
    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/PrefShareText$SliderCard;->setContent(I)V

    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 348
    invoke-virtual {p0, p1, p2}, Lcom/flyersoft/moonreaderp/PrefShareText$SliderAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/flyersoft/moonreaderp/PrefShareText$SliderCard;

    move-result-object p1

    return-object p1
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/flyersoft/moonreaderp/PrefShareText$SliderCard;
    .locals 2

    .line 357
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    sget v0, Lcom/flyersoft/moonreaderp/R$layout;->suggest_book_item:I

    const/4 v1, 0x0

    .line 358
    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    .line 359
    new-instance p2, Lcom/flyersoft/moonreaderp/PrefShareText$SliderAdapter$1;

    invoke-direct {p2, p0}, Lcom/flyersoft/moonreaderp/PrefShareText$SliderAdapter$1;-><init>(Lcom/flyersoft/moonreaderp/PrefShareText$SliderAdapter;)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 366
    new-instance p2, Lcom/flyersoft/moonreaderp/PrefShareText$SliderCard;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText$SliderAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefShareText;

    invoke-direct {p2, v0, p1}, Lcom/flyersoft/moonreaderp/PrefShareText$SliderCard;-><init>(Lcom/flyersoft/moonreaderp/PrefShareText;Landroid/view/View;)V

    return-object p2
.end method
