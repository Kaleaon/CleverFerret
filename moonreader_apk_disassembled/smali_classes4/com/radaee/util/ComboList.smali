.class public Lcom/radaee/util/ComboList;
.super Landroid/widget/ListView;
.source "ComboList.java"


# instance fields
.field m_adt:Lcom/radaee/util/ComboListAdt;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 12
    invoke-direct {p0, p1, p2}, Landroid/widget/ListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 13
    new-instance p1, Lcom/radaee/util/ComboListAdt;

    invoke-direct {p1}, Lcom/radaee/util/ComboListAdt;-><init>()V

    iput-object p1, p0, Lcom/radaee/util/ComboList;->m_adt:Lcom/radaee/util/ComboListAdt;

    return-void
.end method


# virtual methods
.method public set_opts([Ljava/lang/String;)V
    .locals 1

    .line 17
    iget-object v0, p0, Lcom/radaee/util/ComboList;->m_adt:Lcom/radaee/util/ComboListAdt;

    invoke-virtual {p0, v0}, Lcom/radaee/util/ComboList;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 18
    iget-object v0, p0, Lcom/radaee/util/ComboList;->m_adt:Lcom/radaee/util/ComboListAdt;

    invoke-virtual {v0, p1}, Lcom/radaee/util/ComboListAdt;->set_opts([Ljava/lang/String;)V

    .line 19
    sget p1, Lcom/radaee/util/ComboListAdt;->back_color:I

    invoke-virtual {p0, p1}, Lcom/radaee/util/ComboList;->setBackgroundColor(I)V

    return-void
.end method
