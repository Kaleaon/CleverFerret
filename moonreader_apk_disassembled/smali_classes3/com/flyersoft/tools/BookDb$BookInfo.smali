.class public Lcom/flyersoft/tools/BookDb$BookInfo;
.super Ljava/lang/Object;
.source "BookDb.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/tools/BookDb;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "BookInfo"
.end annotation


# instance fields
.field public addTime:Ljava/lang/String;

.field public author:Ljava/lang/String;

.field public book:Ljava/lang/String;

.field public book_arb:Ljava/lang/String;

.field public category:Ljava/lang/String;

.field public coverFile:Ljava/lang/String;

.field public description:Ljava/lang/String;

.field public downloadUrl:Ljava/lang/String;

.field public favorite:Ljava/lang/String;

.field public filename:Ljava/lang/String;

.field public groupBooks:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public groupName:Ljava/lang/String;

.field public index:I

.field public natureSortItem:Lcom/flyersoft/tools/T$NatureSortItem;

.field public pureFilename:Ljava/lang/String;

.field public rate:Ljava/lang/String;

.field public recentId:I

.field public thumbFile:Ljava/lang/String;

.field public topId:I


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 940
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 887
    iput v0, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->index:I

    .line 891
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->groupBooks:Ljava/util/ArrayList;

    .line 942
    iput-object p1, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->book:Ljava/lang/String;

    .line 943
    iput-object p2, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    .line 944
    invoke-static {p2}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->pureFilename:Ljava/lang/String;

    .line 945
    iput-object p3, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->author:Ljava/lang/String;

    .line 946
    iput-object p5, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->category:Ljava/lang/String;

    .line 947
    iput-object p6, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->thumbFile:Ljava/lang/String;

    .line 948
    iput-object p7, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->coverFile:Ljava/lang/String;

    .line 949
    iput-object p8, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->addTime:Ljava/lang/String;

    .line 950
    iput-object p9, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->favorite:Ljava/lang/String;

    .line 951
    iput-object p10, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->downloadUrl:Ljava/lang/String;

    .line 952
    iput-object p11, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->rate:Ljava/lang/String;

    .line 953
    iput-object p14, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->book_arb:Ljava/lang/String;

    .line 955
    :try_start_0
    invoke-virtual {p4}, Ljava/lang/String;->length()I

    move-result p1

    sget p2, Lcom/flyersoft/tools/BookDb;->MAX_DESCRIPTION_SIZE:I

    if-le p1, p2, :cond_0

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    sget p2, Lcom/flyersoft/tools/BookDb;->MAX_DESCRIPTION_SIZE:I

    add-int/lit8 p2, p2, -0x3

    const/4 p3, 0x0

    invoke-virtual {p4, p3, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "..."

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p4

    :cond_0
    iput-object p4, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->description:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 957
    :catchall_0
    const-string p1, ""

    iput-object p1, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->description:Ljava/lang/String;

    :goto_0
    const/4 p1, -0x2

    .line 959
    iput p1, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->topId:I

    iput p1, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->recentId:I

    .line 961
    iput-object p13, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->groupName:Ljava/lang/String;

    .line 962
    invoke-static {p12}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_2

    .line 963
    invoke-static {p12}, Lcom/flyersoft/tools/T;->text2StringList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    .line 965
    iget-object p3, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->groupBooks:Ljava/util/ArrayList;

    invoke-virtual {p3, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 966
    :cond_1
    invoke-virtual {p0}, Lcom/flyersoft/tools/BookDb$BookInfo;->validateGroup()V

    :cond_2
    return-void
.end method


# virtual methods
.method public getGroupListName(Z)Ljava/lang/String;
    .locals 8

    .line 903
    iget-object v0, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->groupBooks:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x4

    if-nez p1, :cond_0

    if-le v0, v1, :cond_0

    const/4 v0, 0x4

    .line 907
    :cond_0
    const-string v2, ""

    const/4 v3, 0x0

    move-object v4, v2

    :goto_0
    const-string v5, "\n"

    if-ge v3, v0, :cond_4

    .line 908
    iget-object v6, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->groupBooks:Ljava/util/ArrayList;

    invoke-virtual {v6, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-static {v6}, Lcom/flyersoft/tools/BookDb;->getBook(Ljava/lang/String;)Lcom/flyersoft/tools/BookDb$BookInfo;

    move-result-object v6

    if-eqz v6, :cond_3

    .line 910
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_1

    move-object v5, v2

    :cond_1
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz p1, :cond_2

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    add-int/lit8 v5, v3, 0x1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, ". "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_1

    :cond_2
    move-object v4, v2

    :goto_1
    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, v6, Lcom/flyersoft/tools/BookDb$BookInfo;->book:Ljava/lang/String;

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_4
    if-nez p1, :cond_6

    .line 913
    iget-object p1, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->groupBooks:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    const/4 v0, 0x5

    if-ne p1, v0, :cond_5

    .line 914
    iget-object p1, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->groupBooks:Ljava/util/ArrayList;

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-static {p1}, Lcom/flyersoft/tools/BookDb;->getBook(Ljava/lang/String;)Lcom/flyersoft/tools/BookDb$BookInfo;

    move-result-object p1

    if-eqz p1, :cond_6

    .line 916
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p1, Lcom/flyersoft/tools/BookDb$BookInfo;->book:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 917
    :cond_5
    iget-object p1, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->groupBooks:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-le p1, v0, :cond_6

    .line 918
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\n..."

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_6
    return-object v4
.end method

.method public getGroupName(Z)Ljava/lang/String;
    .locals 2

    .line 898
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->groupName:Ljava/lang/String;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->book:Ljava/lang/String;

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->groupName:Ljava/lang/String;

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz p1, :cond_1

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v1, " ("

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->groupBooks:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ")"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    :cond_1
    const-string p1, ""

    :goto_1
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getNatureSortItem()Lcom/flyersoft/tools/T$NatureSortItem;
    .locals 1

    .line 971
    iget-object v0, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->natureSortItem:Lcom/flyersoft/tools/T$NatureSortItem;

    if-nez v0, :cond_0

    .line 972
    iget-object v0, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->book:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->createNatureSortItem(Ljava/lang/String;)Lcom/flyersoft/tools/T$NatureSortItem;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->natureSortItem:Lcom/flyersoft/tools/T$NatureSortItem;

    .line 973
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->natureSortItem:Lcom/flyersoft/tools/T$NatureSortItem;

    return-object v0
.end method

.method public isGroup()Z
    .locals 1

    .line 894
    iget-object v0, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->groupBooks:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public isGroupShouldMove()Z
    .locals 2

    .line 935
    iget-object v0, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->groupBooks:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public validateGroup()V
    .locals 3

    .line 924
    invoke-virtual {p0}, Lcom/flyersoft/tools/BookDb$BookInfo;->isGroup()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 925
    iget-object v0, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->groupBooks:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    if-eqz v0, :cond_1

    if-lez v0, :cond_0

    .line 928
    iget-object v1, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->groupBooks:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 929
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->groupBooks:Ljava/util/ArrayList;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    :cond_1
    return-void
.end method
