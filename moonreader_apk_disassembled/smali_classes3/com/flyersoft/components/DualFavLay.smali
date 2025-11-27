.class public Lcom/flyersoft/components/DualFavLay;
.super Ljava/lang/Object;
.source "DualFavLay.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/components/DualFavLay$MainItemClick;,
        Lcom/flyersoft/components/DualFavLay$SubItemClick;,
        Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;
    }
.end annotation


# static fields
.field static lastFavTopsMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private static mAnchor:Landroid/view/View;

.field private static mContext:Landroid/content/Context;

.field private static mTextColor:I

.field public static selfPref:Lcom/flyersoft/components/DualFavLay;


# instance fields
.field allBooks:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/BookDb$BookInfo;",
            ">;"
        }
    .end annotation
.end field

.field backgroundDrawable:Landroid/graphics/drawable/Drawable;

.field bookCountHandler:Landroid/os/Handler;

.field collectionThreadWorking:Z

.field collections:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/BookDb$BookCollection;",
            ">;"
        }
    .end annotation
.end field

.field height:I

.field key:Ljava/lang/String;

.field lay1ItemClick:Landroid/view/View$OnClickListener;

.field onItemClick1:Lcom/flyersoft/components/DualFavLay$MainItemClick;

.field onItemClick2:Lcom/flyersoft/components/DualFavLay$SubItemClick;

.field public popupWindow:Landroid/widget/PopupWindow;

.field root:Landroid/widget/LinearLayout;

.field rv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

.field selectedName:Ljava/lang/String;

.field width:I


# direct methods
.method static bridge synthetic -$$Nest$mgetAllBooks(Lcom/flyersoft/components/DualFavLay;)Ljava/util/ArrayList;
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/components/DualFavLay;->getAllBooks()Ljava/util/ArrayList;

    move-result-object p0

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mgetLastSub(Lcom/flyersoft/components/DualFavLay;)I
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/components/DualFavLay;->getLastSub()I

    move-result p0

    return p0
.end method

.method static bridge synthetic -$$Nest$msaveLastSub(Lcom/flyersoft/components/DualFavLay;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/components/DualFavLay;->saveLastSub()V

    return-void
.end method

.method static bridge synthetic -$$Nest$sfgetmContext()Landroid/content/Context;
    .locals 1

    sget-object v0, Lcom/flyersoft/components/DualFavLay;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static bridge synthetic -$$Nest$sfgetmTextColor()I
    .locals 1

    sget v0, Lcom/flyersoft/components/DualFavLay;->mTextColor:I

    return v0
.end method

.method static constructor <clinit>()V
    .locals 1

    .line 603
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/flyersoft/components/DualFavLay;->lastFavTopsMap:Ljava/util/HashMap;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/view/View;Lcom/flyersoft/components/DualFavLay$MainItemClick;Lcom/flyersoft/components/DualFavLay$SubItemClick;)V
    .locals 2

    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 111
    new-instance v0, Lcom/flyersoft/components/DualFavLay$2;

    invoke-direct {v0, p0}, Lcom/flyersoft/components/DualFavLay$2;-><init>(Lcom/flyersoft/components/DualFavLay;)V

    iput-object v0, p0, Lcom/flyersoft/components/DualFavLay;->lay1ItemClick:Landroid/view/View$OnClickListener;

    .line 591
    new-instance v0, Lcom/flyersoft/components/DualFavLay$6;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/flyersoft/components/DualFavLay$6;-><init>(Lcom/flyersoft/components/DualFavLay;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/flyersoft/components/DualFavLay;->bookCountHandler:Landroid/os/Handler;

    .line 72
    sput-object p0, Lcom/flyersoft/components/DualFavLay;->selfPref:Lcom/flyersoft/components/DualFavLay;

    .line 73
    sput-object p1, Lcom/flyersoft/components/DualFavLay;->mContext:Landroid/content/Context;

    .line 74
    sput-object p2, Lcom/flyersoft/components/DualFavLay;->mAnchor:Landroid/view/View;

    .line 75
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result p2

    if-eqz p2, :cond_0

    const p2, -0x111112

    goto :goto_0

    :cond_0
    const p2, -0xdededf

    :goto_0
    sput p2, Lcom/flyersoft/components/DualFavLay;->mTextColor:I

    .line 76
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-static {}, Lcom/flyersoft/components/DualFavLay;->getBackgroundRes()I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/DualFavLay;->backgroundDrawable:Landroid/graphics/drawable/Drawable;

    .line 77
    iput-object p3, p0, Lcom/flyersoft/components/DualFavLay;->onItemClick1:Lcom/flyersoft/components/DualFavLay$MainItemClick;

    .line 78
    iput-object p4, p0, Lcom/flyersoft/components/DualFavLay;->onItemClick2:Lcom/flyersoft/components/DualFavLay$SubItemClick;

    .line 80
    sget-object p1, Lcom/flyersoft/components/DualFavLay;->mContext:Landroid/content/Context;

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    sget p2, Lcom/flyersoft/moonreaderp/R$layout;->dual_fav_lay:I

    const/4 p3, 0x0

    invoke-virtual {p1, p2, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    iput-object p1, p0, Lcom/flyersoft/components/DualFavLay;->root:Landroid/widget/LinearLayout;

    .line 81
    sget p2, Lcom/flyersoft/moonreaderp/R$id;->list:I

    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    iput-object p1, p0, Lcom/flyersoft/components/DualFavLay;->rv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    .line 82
    sget-boolean p1, Lcom/flyersoft/tools/A;->isTablet:Z

    if-nez p1, :cond_1

    invoke-static {}, Lcom/flyersoft/tools/A;->isLandscape()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 83
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/components/DualFavLay;->rv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {p1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    const/high16 p2, 0x43960000    # 300.0f

    invoke-static {p2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result p2

    iput p2, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 84
    :cond_2
    invoke-virtual {p0}, Lcom/flyersoft/components/DualFavLay;->initLay1()V

    .line 86
    iget-object p1, p0, Lcom/flyersoft/components/DualFavLay;->root:Landroid/widget/LinearLayout;

    const/4 p2, 0x0

    invoke-virtual {p1, p2, p2}, Landroid/widget/LinearLayout;->measure(II)V

    .line 87
    iget-object p1, p0, Lcom/flyersoft/components/DualFavLay;->root:Landroid/widget/LinearLayout;

    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getMeasuredWidth()I

    move-result p1

    iput p1, p0, Lcom/flyersoft/components/DualFavLay;->width:I

    .line 88
    iget-object p1, p0, Lcom/flyersoft/components/DualFavLay;->root:Landroid/widget/LinearLayout;

    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getMeasuredHeight()I

    move-result p1

    iput p1, p0, Lcom/flyersoft/components/DualFavLay;->height:I

    .line 89
    iget-object p1, p0, Lcom/flyersoft/components/DualFavLay;->root:Landroid/widget/LinearLayout;

    invoke-static {}, Lcom/flyersoft/components/DualFavLay;->getBackgroundRes()I

    move-result p3

    invoke-virtual {p1, p3}, Landroid/widget/LinearLayout;->setBackgroundResource(I)V

    .line 91
    new-instance p1, Landroid/widget/PopupWindow;

    iget-object p3, p0, Lcom/flyersoft/components/DualFavLay;->root:Landroid/widget/LinearLayout;

    iget p4, p0, Lcom/flyersoft/components/DualFavLay;->width:I

    iget v0, p0, Lcom/flyersoft/components/DualFavLay;->height:I

    const/4 v1, 0x1

    invoke-direct {p1, p3, p4, v0, v1}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;IIZ)V

    iput-object p1, p0, Lcom/flyersoft/components/DualFavLay;->popupWindow:Landroid/widget/PopupWindow;

    .line 92
    iget-object p3, p0, Lcom/flyersoft/components/DualFavLay;->root:Landroid/widget/LinearLayout;

    if-eqz p3, :cond_3

    new-instance p3, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {p3, p2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    goto :goto_1

    :cond_3
    iget-object p3, p0, Lcom/flyersoft/components/DualFavLay;->backgroundDrawable:Landroid/graphics/drawable/Drawable;

    :goto_1
    invoke-virtual {p1, p3}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 93
    iget-object p1, p0, Lcom/flyersoft/components/DualFavLay;->popupWindow:Landroid/widget/PopupWindow;

    new-instance p2, Lcom/flyersoft/components/DualFavLay$1;

    invoke-direct {p2, p0}, Lcom/flyersoft/components/DualFavLay$1;-><init>(Lcom/flyersoft/components/DualFavLay;)V

    invoke-virtual {p1, p2}, Landroid/widget/PopupWindow;->setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)V

    .line 101
    sget-boolean p1, Lcom/flyersoft/tools/A;->eink:Z

    if-nez p1, :cond_4

    .line 102
    iget-object p1, p0, Lcom/flyersoft/components/DualFavLay;->popupWindow:Landroid/widget/PopupWindow;

    sget p2, Lcom/flyersoft/moonreaderp/R$style;->menuSlideDown:I

    invoke-virtual {p1, p2}, Landroid/widget/PopupWindow;->setAnimationStyle(I)V

    :cond_4
    return-void
.end method

.method public static addToLastFavTop(ILjava/lang/String;)V
    .locals 2

    .line 615
    invoke-static {p0}, Lcom/flyersoft/components/DualFavLay;->getLastFavTop(I)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 616
    invoke-static {p0}, Lcom/flyersoft/components/DualFavLay;->getLastFavTop(I)Ljava/util/ArrayList;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 617
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v0, Lcom/flyersoft/tools/A;->xml_files_folder:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "/last_fav_top"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0}, Lcom/flyersoft/components/DualFavLay;->getLastFavTop(I)Ljava/util/ArrayList;

    move-result-object p0

    invoke-static {p0}, Lcom/flyersoft/tools/T;->stringList2Text(Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/flyersoft/tools/T;->saveFileText(Ljava/lang/String;Ljava/lang/String;)Z

    return-void
.end method

.method private getAllBooks()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/BookDb$BookInfo;",
            ">;"
        }
    .end annotation

    .line 588
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getAllBooks()Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public static getBackgroundRes()I
    .locals 1

    .line 68
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-eqz v0, :cond_0

    sget v0, Lcom/flyersoft/moonreaderp/R$drawable;->dialog_full_holo_dark:I

    return v0

    :cond_0
    sget v0, Lcom/flyersoft/moonreaderp/R$drawable;->dialog_full_holo_light:I

    return v0
.end method

.method public static getLastFavTop(I)Ljava/util/ArrayList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 606
    sget-object v0, Lcom/flyersoft/components/DualFavLay;->lastFavTopsMap:Ljava/util/HashMap;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 608
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/flyersoft/tools/A;->xml_files_folder:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/last_fav_top"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getFileText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->text2StringList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    .line 609
    sget-object v1, Lcom/flyersoft/components/DualFavLay;->lastFavTopsMap:Ljava/util/HashMap;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {v1, p0, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-object v0
.end method

.method private getLastSub()I
    .locals 4

    .line 282
    sget-object v0, Lcom/flyersoft/components/DualFavLay;->mContext:Landroid/content/Context;

    const-string v1, "last_fav_index"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, ""

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v3, Lcom/flyersoft/tools/A;->dualFavType:I

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method private getMaxItemsWidth()I
    .locals 2

    .line 277
    invoke-static {}, Lcom/flyersoft/tools/A;->getScreenWidth()I

    move-result v0

    int-to-float v0, v0

    invoke-static {v0}, Lcom/flyersoft/tools/A;->vd(F)I

    move-result v0

    add-int/lit16 v0, v0, -0xd0

    const/16 v1, 0xc8

    if-le v0, v1, :cond_0

    const/high16 v0, 0x43480000    # 200.0f

    goto :goto_0

    :cond_0
    int-to-float v0, v0

    .line 278
    :goto_0
    invoke-static {v0}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v0

    return v0
.end method

.method public static removeFromLastFavTop(ILjava/lang/String;)V
    .locals 1

    .line 621
    invoke-static {p0}, Lcom/flyersoft/components/DualFavLay;->getLastFavTop(I)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 622
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v0, Lcom/flyersoft/tools/A;->xml_files_folder:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "/last_fav_top"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0}, Lcom/flyersoft/components/DualFavLay;->getLastFavTop(I)Ljava/util/ArrayList;

    move-result-object p0

    invoke-static {p0}, Lcom/flyersoft/tools/T;->stringList2Text(Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/flyersoft/tools/T;->saveFileText(Ljava/lang/String;Ljava/lang/String;)Z

    return-void
.end method

.method private saveLastSub()V
    .locals 3

    .line 286
    sget-object v0, Lcom/flyersoft/components/DualFavLay;->mContext:Landroid/content/Context;

    const-string v1, "last_fav_index"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, ""

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v2, Lcom/flyersoft/tools/A;->dualFavType:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/flyersoft/components/DualFavLay;->rv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    .line 287
    invoke-virtual {v2}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->findFirstVisibleItem()I

    move-result v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    return-void
.end method

.method private setLongTapEvent(ILandroid/widget/TextView;)V
    .locals 1

    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    .line 224
    new-instance p1, Lcom/flyersoft/components/DualFavLay$4;

    invoke-direct {p1, p0, p2}, Lcom/flyersoft/components/DualFavLay$4;-><init>(Lcom/flyersoft/components/DualFavLay;Landroid/widget/TextView;)V

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    return-void

    :cond_0
    const/4 v0, 0x2

    if-eq p1, v0, :cond_2

    const/4 v0, 0x3

    if-eq p1, v0, :cond_2

    const/4 v0, 0x4

    if-eq p1, v0, :cond_2

    const/4 v0, 0x5

    if-ne p1, v0, :cond_1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    .line 273
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    return-void

    .line 243
    :cond_2
    :goto_0
    new-instance v0, Lcom/flyersoft/components/DualFavLay$5;

    invoke-direct {v0, p0, p2, p1}, Lcom/flyersoft/components/DualFavLay$5;-><init>(Lcom/flyersoft/components/DualFavLay;Landroid/widget/TextView;I)V

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    return-void
.end method


# virtual methods
.method public initLay1()V
    .locals 1

    const/4 v0, 0x0

    .line 127
    invoke-virtual {p0, v0}, Lcom/flyersoft/components/DualFavLay;->initLay1(Ljava/lang/String;)V

    return-void
.end method

.method public initLay1(Ljava/lang/String;)V
    .locals 10

    .line 131
    iget-object v0, p0, Lcom/flyersoft/components/DualFavLay;->root:Landroid/widget/LinearLayout;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->lay1:I

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 132
    invoke-static {}, Lcom/flyersoft/tools/A;->useAmoled()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 133
    sget v1, Lcom/flyersoft/tools/C;->amoledBlack2:I

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    goto :goto_0

    .line 134
    :cond_0
    sget-boolean v1, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-eqz v1, :cond_1

    .line 135
    invoke-static {}, Lcom/flyersoft/tools/C;->getOtherFrameColor()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 137
    :cond_1
    :goto_0
    invoke-direct {p0}, Lcom/flyersoft/components/DualFavLay;->getMaxItemsWidth()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 138
    :goto_1
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v4

    const/4 v5, 0x1

    if-ge v3, v4, :cond_a

    .line 139
    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_9

    .line 141
    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 142
    invoke-virtual {v4}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-static {v6}, Lcom/flyersoft/tools/T;->string2Int(Ljava/lang/String;)I

    move-result v6

    if-lez v6, :cond_2

    .line 143
    sget v7, Lcom/flyersoft/tools/A;->dualFavType:I

    if-ne v6, v7, :cond_2

    goto :goto_2

    :cond_2
    const/4 v5, 0x0

    .line 144
    :goto_2
    invoke-virtual {v4, v1}, Landroid/widget/TextView;->setMaxWidth(I)V

    .line 145
    sget-object v7, Lcom/flyersoft/components/DualFavLay;->mContext:Landroid/content/Context;

    invoke-static {v7}, Lcom/flyersoft/tools/A;->getSelectedRes(Landroid/content/Context;)I

    move-result v7

    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setBackgroundResource(I)V

    .line 146
    invoke-static {}, Lcom/flyersoft/components/MyMenu;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v7

    invoke-virtual {v4, v7, v5}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 147
    sget v7, Lcom/flyersoft/components/DualFavLay;->mTextColor:I

    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 148
    iget-object v7, p0, Lcom/flyersoft/components/DualFavLay;->lay1ItemClick:Landroid/view/View$OnClickListener;

    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    if-eqz v5, :cond_3

    .line 150
    sget v7, Lcom/flyersoft/moonreaderp/R$drawable;->date_dropdown_arrow2:I

    goto :goto_3

    :cond_3
    sget v7, Lcom/flyersoft/moonreaderp/R$drawable;->date_dropdown_arrow3:I

    .line 149
    :goto_3
    invoke-virtual {v4, v2, v2, v7, v2}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    const/4 v7, 0x5

    if-ne v6, v7, :cond_4

    .line 152
    sget-object v7, Lcom/flyersoft/components/DualFavLay;->mContext:Landroid/content/Context;

    sget v8, Lcom/flyersoft/moonreaderp/R$array;->shelf_sort_by:I

    const/4 v9, 0x3

    invoke-static {v7, v8, v9}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_4
    if-eqz v5, :cond_5

    .line 154
    invoke-virtual {v4}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v5

    invoke-interface {v5}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/flyersoft/components/DualFavLay;->selectedName:Ljava/lang/String;

    .line 156
    :cond_5
    invoke-static {}, Lcom/flyersoft/tools/A;->isLandscape()Z

    move-result v5

    if-eqz v5, :cond_6

    sget-boolean v5, Lcom/flyersoft/tools/A;->isTablet:Z

    if-nez v5, :cond_6

    .line 157
    invoke-virtual {v4}, Landroid/widget/TextView;->getPaddingLeft()I

    move-result v5

    const/high16 v7, 0x41200000    # 10.0f

    invoke-static {v7}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v8

    invoke-virtual {v4}, Landroid/widget/TextView;->getPaddingRight()I

    move-result v9

    invoke-static {v7}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v7

    invoke-virtual {v4, v5, v8, v9, v7}, Landroid/widget/TextView;->setPadding(IIII)V

    goto :goto_4

    .line 158
    :cond_6
    sget-boolean v5, Lcom/flyersoft/tools/A;->isLargeTablet:Z

    if-nez v5, :cond_7

    sget-boolean v5, Lcom/flyersoft/tools/A;->isTablet:Z

    if-eqz v5, :cond_8

    invoke-static {}, Lcom/flyersoft/tools/A;->isLandscape()Z

    move-result v5

    if-nez v5, :cond_8

    .line 159
    :cond_7
    invoke-virtual {v4}, Landroid/widget/TextView;->getPaddingLeft()I

    move-result v5

    const/high16 v7, 0x41a00000    # 20.0f

    invoke-static {v7}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v8

    invoke-virtual {v4}, Landroid/widget/TextView;->getPaddingRight()I

    move-result v9

    invoke-static {v7}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v7

    invoke-virtual {v4, v5, v8, v9, v7}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 161
    :cond_8
    :goto_4
    invoke-direct {p0, v6, v4}, Lcom/flyersoft/components/DualFavLay;->setLongTapEvent(ILandroid/widget/TextView;)V

    :cond_9
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_1

    .line 165
    :cond_a
    sget v0, Lcom/flyersoft/tools/A;->dualFavType:I

    if-lez v0, :cond_c

    .line 166
    iput-boolean v5, p0, Lcom/flyersoft/components/DualFavLay;->collectionThreadWorking:Z

    .line 167
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/components/DualFavLay;->collections:Ljava/util/ArrayList;

    .line 168
    iget-object v0, p0, Lcom/flyersoft/components/DualFavLay;->rv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {v0, v2}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->setVisibility(I)V

    .line 169
    iget-object v0, p0, Lcom/flyersoft/components/DualFavLay;->rv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-static {}, Lcom/flyersoft/tools/A;->useAmoled()Z

    move-result v1

    if-eqz v1, :cond_b

    sget v1, Lcom/flyersoft/tools/C;->amoledBlack2:I

    goto :goto_5

    :cond_b
    invoke-static {}, Lcom/flyersoft/tools/C;->getOtherFrameColor()I

    move-result v1

    :goto_5
    invoke-virtual {v0, v1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->setBackgroundColor(I)V

    .line 170
    iget-object v0, p0, Lcom/flyersoft/components/DualFavLay;->rv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    new-instance v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    sget-object v3, Lcom/flyersoft/components/DualFavLay;->mContext:Landroid/content/Context;

    invoke-direct {v1, v3, v5, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 171
    iget-object v0, p0, Lcom/flyersoft/components/DualFavLay;->rv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    new-instance v1, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;

    invoke-direct {v1, p0}, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;-><init>(Lcom/flyersoft/components/DualFavLay;)V

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->setAdapter(Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;)V

    .line 172
    iget-object v0, p0, Lcom/flyersoft/components/DualFavLay;->bookCountHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 173
    iget-object v0, p0, Lcom/flyersoft/components/DualFavLay;->rv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    sget v1, Lcom/flyersoft/tools/A;->dualFavType:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->setTag(Ljava/lang/Object;)V

    .line 175
    new-instance v0, Lcom/flyersoft/components/DualFavLay$3;

    invoke-direct {v0, p0, p1}, Lcom/flyersoft/components/DualFavLay$3;-><init>(Lcom/flyersoft/components/DualFavLay;Ljava/lang/String;)V

    .line 195
    invoke-virtual {v0}, Lcom/flyersoft/components/DualFavLay$3;->start()V

    return-void

    .line 197
    :cond_c
    iget-object p1, p0, Lcom/flyersoft/components/DualFavLay;->rv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->setVisibility(I)V

    return-void
.end method

.method public show(II)V
    .locals 6

    const/high16 v0, 0x41000000    # 8.0f

    .line 106
    invoke-static {v0}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v0

    sub-int/2addr p2, v0

    .line 107
    sget-object v0, Lcom/flyersoft/components/DualFavLay;->mAnchor:Landroid/view/View;

    iget-object v1, p0, Lcom/flyersoft/components/DualFavLay;->popupWindow:Landroid/widget/PopupWindow;

    iget v2, p0, Lcom/flyersoft/components/DualFavLay;->width:I

    iget v3, p0, Lcom/flyersoft/components/DualFavLay;->height:I

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-static/range {v0 .. v5}, Lcom/flyersoft/components/MyMenu;->setMenuAnimation(Landroid/view/View;Landroid/widget/PopupWindow;IIIZ)V

    .line 108
    iget-object v0, p0, Lcom/flyersoft/components/DualFavLay;->popupWindow:Landroid/widget/PopupWindow;

    sget-object v1, Lcom/flyersoft/components/DualFavLay;->mAnchor:Landroid/view/View;

    invoke-virtual {v0, v1, p1, p2}, Landroid/widget/PopupWindow;->showAsDropDown(Landroid/view/View;II)V

    return-void
.end method
