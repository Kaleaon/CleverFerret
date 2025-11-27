.class public Lcom/flyersoft/moonreaderp/ActivityMain$FavFolderAdapter;
.super Landroid/widget/BaseAdapter;
.source "ActivityMain.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "FavFolderAdapter"
.end annotation


# instance fields
.field checked:[Z

.field cloudCount:I

.field items:[Ljava/lang/CharSequence;

.field listener:Landroid/widget/CompoundButton$OnCheckedChangeListener;

.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;


# direct methods
.method public constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;[Ljava/lang/CharSequence;[ZI)V
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

    .line 13950
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FavFolderAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 13979
    new-instance p1, Lcom/flyersoft/moonreaderp/ActivityMain$FavFolderAdapter$1;

    invoke-direct {p1, p0}, Lcom/flyersoft/moonreaderp/ActivityMain$FavFolderAdapter$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$FavFolderAdapter;)V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FavFolderAdapter;->listener:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    .line 13951
    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FavFolderAdapter;->items:[Ljava/lang/CharSequence;

    .line 13952
    iput-object p3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FavFolderAdapter;->checked:[Z

    .line 13953
    iput p4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FavFolderAdapter;->cloudCount:I

    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 2

    .line 13957
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FavFolderAdapter;->items:[Ljava/lang/CharSequence;

    array-length v0, v0

    iget v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FavFolderAdapter;->cloudCount:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 0

    .line 13961
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1
.end method

.method public getItemId(I)J
    .locals 2

    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    if-nez p2, :cond_0

    .line 13969
    new-instance p2, Landroid/widget/CheckBox;

    iget-object p3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FavFolderAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p2, p3}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    goto :goto_0

    :cond_0
    check-cast p2, Landroid/widget/CheckBox;

    .line 13970
    :goto_0
    iget p3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FavFolderAdapter;->cloudCount:I

    add-int/2addr p1, p3

    .line 13971
    iget-object p3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FavFolderAdapter;->items:[Ljava/lang/CharSequence;

    aget-object p3, p3, p1

    invoke-virtual {p2, p3}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    .line 13972
    iget-object p3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FavFolderAdapter;->checked:[Z

    aget-boolean p3, p3, p1

    invoke-virtual {p2, p3}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 13973
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/widget/CheckBox;->setTag(Ljava/lang/Object;)V

    .line 13974
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FavFolderAdapter;->listener:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    invoke-virtual {p2, p1}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 13975
    invoke-static {p2}, Lcom/flyersoft/tools/A;->checkNightTextColors(Landroid/view/View;)V

    return-object p2
.end method
