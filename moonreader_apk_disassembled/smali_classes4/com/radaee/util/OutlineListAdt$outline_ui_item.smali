.class public Lcom/radaee/util/OutlineListAdt$outline_ui_item;
.super Ljava/lang/Object;
.source "OutlineListAdt.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/radaee/util/OutlineListAdt;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "outline_ui_item"
.end annotation


# instance fields
.field private btn_goto:Landroid/widget/ImageView;

.field private m_layout:Landroid/widget/RelativeLayout;

.field private m_outline:Lcom/radaee/pdf/Document$Outline;

.field private m_type:I

.field final synthetic this$0:Lcom/radaee/util/OutlineListAdt;

.field private txt_name:Landroid/widget/TextView;


# direct methods
.method private constructor <init>(Lcom/radaee/util/OutlineListAdt;Landroid/content/Context;ILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0,
            0x0,
            0x0
        }
        names = {
            null,
            null,
            null,
            null
        }
    .end annotation

    .line 53
    iput-object p1, p0, Lcom/radaee/util/OutlineListAdt$outline_ui_item;->this$0:Lcom/radaee/util/OutlineListAdt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x1

    if-ne p3, p1, :cond_0

    const/4 p3, 0x0

    .line 55
    :cond_0
    iput p3, p0, Lcom/radaee/util/OutlineListAdt$outline_ui_item;->m_type:I

    const/4 p1, 0x0

    .line 56
    iput-object p1, p0, Lcom/radaee/util/OutlineListAdt$outline_ui_item;->m_outline:Lcom/radaee/pdf/Document$Outline;

    .line 57
    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    sget p3, Lcom/radaee/viewlib/R$layout;->item_outline:I

    invoke-virtual {p2, p3, p1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/RelativeLayout;

    iput-object p1, p0, Lcom/radaee/util/OutlineListAdt$outline_ui_item;->m_layout:Landroid/widget/RelativeLayout;

    .line 58
    sget p2, Lcom/radaee/viewlib/R$id;->txt_name:I

    invoke-virtual {p1, p2}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/radaee/util/OutlineListAdt$outline_ui_item;->txt_name:Landroid/widget/TextView;

    .line 59
    invoke-virtual {p1, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 60
    iget-object p1, p0, Lcom/radaee/util/OutlineListAdt$outline_ui_item;->m_layout:Landroid/widget/RelativeLayout;

    sget p2, Lcom/radaee/viewlib/R$id;->btn_goto:I

    invoke-virtual {p1, p2}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/radaee/util/OutlineListAdt$outline_ui_item;->btn_goto:Landroid/widget/ImageView;

    const/4 p2, 0x4

    .line 61
    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 62
    iget-object p1, p0, Lcom/radaee/util/OutlineListAdt$outline_ui_item;->m_layout:Landroid/widget/RelativeLayout;

    invoke-virtual {p1, p0}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/radaee/util/OutlineListAdt;Landroid/content/Context;ILjava/lang/String;Lcom/radaee/util/OutlineListAdt$1;)V
    .locals 0

    .line 29
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/radaee/util/OutlineListAdt$outline_ui_item;-><init>(Lcom/radaee/util/OutlineListAdt;Landroid/content/Context;ILjava/lang/String;)V

    return-void
.end method

.method private constructor <init>(Lcom/radaee/util/OutlineListAdt;Landroid/content/Context;Lcom/radaee/pdf/Document$Outline;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0,
            0x0
        }
        names = {
            null,
            null,
            null
        }
    .end annotation

    .line 37
    iput-object p1, p0, Lcom/radaee/util/OutlineListAdt$outline_ui_item;->this$0:Lcom/radaee/util/OutlineListAdt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x1

    .line 38
    iput p1, p0, Lcom/radaee/util/OutlineListAdt$outline_ui_item;->m_type:I

    .line 39
    iput-object p3, p0, Lcom/radaee/util/OutlineListAdt$outline_ui_item;->m_outline:Lcom/radaee/pdf/Document$Outline;

    .line 40
    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    sget p2, Lcom/radaee/viewlib/R$layout;->item_outline:I

    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/RelativeLayout;

    iput-object p1, p0, Lcom/radaee/util/OutlineListAdt$outline_ui_item;->m_layout:Landroid/widget/RelativeLayout;

    .line 41
    sget p2, Lcom/radaee/viewlib/R$id;->txt_name:I

    invoke-virtual {p1, p2}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/radaee/util/OutlineListAdt$outline_ui_item;->txt_name:Landroid/widget/TextView;

    .line 42
    invoke-virtual {p3}, Lcom/radaee/pdf/Document$Outline;->GetTitle()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 43
    iget-object p1, p0, Lcom/radaee/util/OutlineListAdt$outline_ui_item;->m_layout:Landroid/widget/RelativeLayout;

    sget p2, Lcom/radaee/viewlib/R$id;->btn_goto:I

    invoke-virtual {p1, p2}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/radaee/util/OutlineListAdt$outline_ui_item;->btn_goto:Landroid/widget/ImageView;

    .line 44
    invoke-virtual {p3}, Lcom/radaee/pdf/Document$Outline;->GetChild()Lcom/radaee/pdf/Document$Outline;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 46
    iget-object p1, p0, Lcom/radaee/util/OutlineListAdt$outline_ui_item;->btn_goto:Landroid/widget/ImageView;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 47
    iget-object p1, p0, Lcom/radaee/util/OutlineListAdt$outline_ui_item;->btn_goto:Landroid/widget/ImageView;

    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    .line 50
    :cond_0
    iget-object p1, p0, Lcom/radaee/util/OutlineListAdt$outline_ui_item;->btn_goto:Landroid/widget/ImageView;

    const/4 p2, 0x4

    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setVisibility(I)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/radaee/util/OutlineListAdt;Landroid/content/Context;Lcom/radaee/pdf/Document$Outline;Lcom/radaee/util/OutlineListAdt$1;)V
    .locals 0

    .line 29
    invoke-direct {p0, p1, p2, p3}, Lcom/radaee/util/OutlineListAdt$outline_ui_item;-><init>(Lcom/radaee/util/OutlineListAdt;Landroid/content/Context;Lcom/radaee/pdf/Document$Outline;)V

    return-void
.end method

.method static synthetic access$700(Lcom/radaee/util/OutlineListAdt$outline_ui_item;)Landroid/widget/RelativeLayout;
    .locals 0

    .line 29
    iget-object p0, p0, Lcom/radaee/util/OutlineListAdt$outline_ui_item;->m_layout:Landroid/widget/RelativeLayout;

    return-object p0
.end method


# virtual methods
.method public GetPageNO()I
    .locals 1

    .line 66
    iget-object v0, p0, Lcom/radaee/util/OutlineListAdt$outline_ui_item;->m_outline:Lcom/radaee/pdf/Document$Outline;

    if-eqz v0, :cond_0

    .line 67
    invoke-virtual {v0}, Lcom/radaee/pdf/Document$Outline;->GetDest()I

    move-result v0

    return v0

    :cond_0
    const/4 v0, -0x1

    return v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 74
    iget-object v0, p0, Lcom/radaee/util/OutlineListAdt$outline_ui_item;->btn_goto:Landroid/widget/ImageView;

    if-ne p1, v0, :cond_0

    .line 76
    new-instance p1, Lcom/radaee/util/OutlineListAdt$OutlineRec;

    iget-object v0, p0, Lcom/radaee/util/OutlineListAdt$outline_ui_item;->this$0:Lcom/radaee/util/OutlineListAdt;

    const/4 v1, 0x0

    invoke-direct {p1, v0, v1}, Lcom/radaee/util/OutlineListAdt$OutlineRec;-><init>(Lcom/radaee/util/OutlineListAdt;Lcom/radaee/util/OutlineListAdt$1;)V

    .line 77
    iget-object v0, p0, Lcom/radaee/util/OutlineListAdt$outline_ui_item;->m_outline:Lcom/radaee/pdf/Document$Outline;

    invoke-static {p1, v0}, Lcom/radaee/util/OutlineListAdt$OutlineRec;->access$102(Lcom/radaee/util/OutlineListAdt$OutlineRec;Lcom/radaee/pdf/Document$Outline;)Lcom/radaee/pdf/Document$Outline;

    .line 78
    iget-object v0, p0, Lcom/radaee/util/OutlineListAdt$outline_ui_item;->this$0:Lcom/radaee/util/OutlineListAdt;

    invoke-static {v0}, Lcom/radaee/util/OutlineListAdt;->access$300(Lcom/radaee/util/OutlineListAdt;)Lcom/radaee/util/OutlineListAdt$OutlineRec;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/radaee/util/OutlineListAdt$OutlineRec;->access$202(Lcom/radaee/util/OutlineListAdt$OutlineRec;Lcom/radaee/util/OutlineListAdt$OutlineRec;)Lcom/radaee/util/OutlineListAdt$OutlineRec;

    .line 79
    iget-object v0, p0, Lcom/radaee/util/OutlineListAdt$outline_ui_item;->this$0:Lcom/radaee/util/OutlineListAdt;

    invoke-static {v0, p1}, Lcom/radaee/util/OutlineListAdt;->access$302(Lcom/radaee/util/OutlineListAdt;Lcom/radaee/util/OutlineListAdt$OutlineRec;)Lcom/radaee/util/OutlineListAdt$OutlineRec;

    .line 80
    iget-object p1, p0, Lcom/radaee/util/OutlineListAdt$outline_ui_item;->this$0:Lcom/radaee/util/OutlineListAdt;

    invoke-static {p1}, Lcom/radaee/util/OutlineListAdt;->access$400(Lcom/radaee/util/OutlineListAdt;)V

    return-void

    .line 82
    :cond_0
    iget-object v0, p0, Lcom/radaee/util/OutlineListAdt$outline_ui_item;->m_layout:Landroid/widget/RelativeLayout;

    if-ne p1, v0, :cond_1

    .line 84
    iget-object p1, p0, Lcom/radaee/util/OutlineListAdt$outline_ui_item;->this$0:Lcom/radaee/util/OutlineListAdt;

    invoke-static {p1}, Lcom/radaee/util/OutlineListAdt;->access$300(Lcom/radaee/util/OutlineListAdt;)Lcom/radaee/util/OutlineListAdt$OutlineRec;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 86
    iget-object p1, p0, Lcom/radaee/util/OutlineListAdt$outline_ui_item;->this$0:Lcom/radaee/util/OutlineListAdt;

    invoke-static {p1}, Lcom/radaee/util/OutlineListAdt;->access$300(Lcom/radaee/util/OutlineListAdt;)Lcom/radaee/util/OutlineListAdt$OutlineRec;

    move-result-object v0

    invoke-static {v0}, Lcom/radaee/util/OutlineListAdt$OutlineRec;->access$200(Lcom/radaee/util/OutlineListAdt$OutlineRec;)Lcom/radaee/util/OutlineListAdt$OutlineRec;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/radaee/util/OutlineListAdt;->access$302(Lcom/radaee/util/OutlineListAdt;Lcom/radaee/util/OutlineListAdt$OutlineRec;)Lcom/radaee/util/OutlineListAdt$OutlineRec;

    .line 87
    iget-object p1, p0, Lcom/radaee/util/OutlineListAdt$outline_ui_item;->this$0:Lcom/radaee/util/OutlineListAdt;

    invoke-static {p1}, Lcom/radaee/util/OutlineListAdt;->access$400(Lcom/radaee/util/OutlineListAdt;)V

    :cond_1
    return-void
.end method
