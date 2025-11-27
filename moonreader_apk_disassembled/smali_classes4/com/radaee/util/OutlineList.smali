.class public Lcom/radaee/util/OutlineList;
.super Landroid/widget/ListView;
.source "OutlineList.java"


# instance fields
.field m_adt:Lcom/radaee/util/OutlineListAdt;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 14
    invoke-direct {p0, p1, p2}, Landroid/widget/ListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 15
    new-instance p2, Lcom/radaee/util/OutlineListAdt;

    invoke-direct {p2, p1}, Lcom/radaee/util/OutlineListAdt;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/radaee/util/OutlineList;->m_adt:Lcom/radaee/util/OutlineListAdt;

    return-void
.end method


# virtual methods
.method public GetItem(I)Lcom/radaee/util/OutlineListAdt$outline_ui_item;
    .locals 1

    .line 24
    iget-object v0, p0, Lcom/radaee/util/OutlineList;->m_adt:Lcom/radaee/util/OutlineListAdt;

    invoke-virtual {v0, p1}, Lcom/radaee/util/OutlineListAdt;->getItem(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/radaee/util/OutlineListAdt$outline_ui_item;

    return-object p1
.end method

.method public SetOutlines(Lcom/radaee/pdf/Document;)V
    .locals 1

    .line 19
    iget-object v0, p0, Lcom/radaee/util/OutlineList;->m_adt:Lcom/radaee/util/OutlineListAdt;

    invoke-virtual {p0, v0}, Lcom/radaee/util/OutlineList;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 20
    iget-object v0, p0, Lcom/radaee/util/OutlineList;->m_adt:Lcom/radaee/util/OutlineListAdt;

    invoke-virtual {v0, p1}, Lcom/radaee/util/OutlineListAdt;->set_outlines(Lcom/radaee/pdf/Document;)V

    return-void
.end method
