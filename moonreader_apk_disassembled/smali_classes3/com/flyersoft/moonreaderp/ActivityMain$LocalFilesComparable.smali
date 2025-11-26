.class Lcom/flyersoft/moonreaderp/ActivityMain$LocalFilesComparable;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "LocalFilesComparable"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lcom/flyersoft/tools/T$FileItem;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 6983
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$LocalFilesComparable;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/flyersoft/tools/T$FileItem;Lcom/flyersoft/tools/T$FileItem;)I
    .locals 21

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    .line 6986
    :try_start_0
    iget-object v3, v0, Lcom/flyersoft/tools/T$FileItem;->name:Ljava/lang/String;

    .line 6987
    iget-object v4, v1, Lcom/flyersoft/tools/T$FileItem;->name:Ljava/lang/String;

    .line 6988
    sget v5, Lcom/flyersoft/tools/A;->files_from:I

    const/4 v6, 0x4

    const/4 v7, 0x1

    if-ne v5, v6, :cond_0

    const-string v5, "Shared with me"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    return v7

    .line 6990
    :cond_0
    invoke-virtual {v0}, Lcom/flyersoft/tools/T$FileItem;->getImageRes()I

    move-result v5

    .line 6991
    invoke-virtual {v1}, Lcom/flyersoft/tools/T$FileItem;->getImageRes()I

    move-result v8

    .line 6992
    sget v9, Lcom/flyersoft/moonreaderp/R$drawable;->iconfolder:I

    if-ne v8, v9, :cond_1

    sget v9, Lcom/flyersoft/moonreaderp/R$drawable;->iconfolder:I

    if-eq v5, v9, :cond_1

    return v7

    .line 6994
    :cond_1
    sget v9, Lcom/flyersoft/moonreaderp/R$drawable;->iconfolder:I

    const/4 v10, -0x1

    if-eq v8, v9, :cond_2

    sget v9, Lcom/flyersoft/moonreaderp/R$drawable;->iconfolder:I

    if-ne v5, v9, :cond_2

    return v10

    .line 6996
    :cond_2
    sget v9, Lcom/flyersoft/moonreaderp/R$drawable;->aiunknow:I

    if-eq v8, v9, :cond_3

    sget v9, Lcom/flyersoft/moonreaderp/R$drawable;->aiunknow:I

    if-ne v5, v9, :cond_3

    return v7

    .line 6998
    :cond_3
    sget v9, Lcom/flyersoft/moonreaderp/R$drawable;->aiunknow:I

    if-ne v8, v9, :cond_4

    sget v8, Lcom/flyersoft/moonreaderp/R$drawable;->aiunknow:I

    if-eq v5, v8, :cond_4

    return v10

    .line 7000
    :cond_4
    iget-wide v8, v0, Lcom/flyersoft/tools/T$FileItem;->size:J

    .line 7001
    iget-wide v11, v1, Lcom/flyersoft/tools/T$FileItem;->size:J

    .line 7002
    iget-wide v13, v0, Lcom/flyersoft/tools/T$FileItem;->date:J

    move-wide v15, v11

    const/4 v5, -0x1

    .line 7003
    iget-wide v10, v1, Lcom/flyersoft/tools/T$FileItem;->date:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-object/from16 v12, p0

    const/16 v17, 0x0

    .line 7005
    :try_start_1
    iget-object v2, v12, Lcom/flyersoft/moonreaderp/ActivityMain$LocalFilesComparable;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$fgetcurrent_sort_by(Lcom/flyersoft/moonreaderp/ActivityMain;)I

    move-result v2

    if-eqz v2, :cond_14

    const-wide/16 v18, 0x0

    if-eq v2, v7, :cond_11

    const/16 v20, -0x1

    const/4 v5, 0x2

    if-eq v2, v5, :cond_e

    const/4 v5, 0x3

    if-eq v2, v5, :cond_b

    if-eq v2, v6, :cond_8

    const/4 v0, 0x5

    if-eq v2, v0, :cond_5

    return v17

    :cond_5
    cmp-long v0, v13, v10

    if-nez v0, :cond_6

    .line 7026
    invoke-static {v3, v4}, Lcom/flyersoft/moonreaderp/ActivityMain;->myStringCompare(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0

    :cond_6
    sub-long/2addr v10, v13

    cmp-long v0, v10, v18

    if-lez v0, :cond_7

    return v7

    :cond_7
    return v20

    :cond_8
    cmp-long v0, v8, v15

    if-nez v0, :cond_9

    .line 7018
    invoke-static {v3, v4}, Lcom/flyersoft/moonreaderp/ActivityMain;->myStringCompare(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0

    :cond_9
    sub-long v0, v15, v8

    cmp-long v2, v0, v18

    if-lez v2, :cond_a

    return v7

    :cond_a
    return v20

    .line 7010
    :cond_b
    sget-boolean v2, Lcom/flyersoft/tools/A;->naturalSort:Z

    if-nez v2, :cond_c

    const/4 v0, 0x0

    goto :goto_0

    :cond_c
    invoke-virtual {v0}, Lcom/flyersoft/tools/T$FileItem;->getNatureSortItem()Lcom/flyersoft/tools/T$NatureSortItem;

    move-result-object v0

    invoke-virtual {v1}, Lcom/flyersoft/tools/T$FileItem;->getNatureSortItem()Lcom/flyersoft/tools/T$NatureSortItem;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/flyersoft/tools/T;->getNatureSortResult(Lcom/flyersoft/tools/T$NatureSortItem;Lcom/flyersoft/tools/T$NatureSortItem;)I

    move-result v0

    :goto_0
    if-eqz v0, :cond_d

    neg-int v0, v0

    return v0

    .line 7011
    :cond_d
    invoke-static {v3, v4}, Lcom/flyersoft/moonreaderp/ActivityMain;->myStringCompare(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    neg-int v0, v0

    return v0

    :cond_e
    cmp-long v0, v13, v10

    if-nez v0, :cond_f

    .line 7022
    invoke-static {v3, v4}, Lcom/flyersoft/moonreaderp/ActivityMain;->myStringCompare(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0

    :cond_f
    sub-long/2addr v13, v10

    cmp-long v0, v13, v18

    if-lez v0, :cond_10

    return v7

    :cond_10
    return v20

    :cond_11
    const/16 v20, -0x1

    cmp-long v0, v8, v15

    if-nez v0, :cond_12

    .line 7014
    invoke-static {v3, v4}, Lcom/flyersoft/moonreaderp/ActivityMain;->myStringCompare(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0

    :cond_12
    sub-long/2addr v8, v15

    cmp-long v0, v8, v18

    if-lez v0, :cond_13

    return v7

    :cond_13
    return v20

    .line 7007
    :cond_14
    sget-boolean v2, Lcom/flyersoft/tools/A;->naturalSort:Z

    if-nez v2, :cond_15

    const/4 v0, 0x0

    goto :goto_1

    :cond_15
    invoke-virtual {v0}, Lcom/flyersoft/tools/T$FileItem;->getNatureSortItem()Lcom/flyersoft/tools/T$NatureSortItem;

    move-result-object v0

    invoke-virtual {v1}, Lcom/flyersoft/tools/T$FileItem;->getNatureSortItem()Lcom/flyersoft/tools/T$NatureSortItem;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/flyersoft/tools/T;->getNatureSortResult(Lcom/flyersoft/tools/T$NatureSortItem;Lcom/flyersoft/tools/T$NatureSortItem;)I

    move-result v0

    :goto_1
    if-eqz v0, :cond_16

    return v0

    .line 7008
    :cond_16
    invoke-static {v3, v4}, Lcom/flyersoft/moonreaderp/ActivityMain;->myStringCompare(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    return v0

    :catchall_0
    move-exception v0

    goto :goto_2

    :catchall_1
    move-exception v0

    move-object/from16 v12, p0

    const/16 v17, 0x0

    .line 7032
    :goto_2
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return v17
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
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

    .line 6983
    check-cast p1, Lcom/flyersoft/tools/T$FileItem;

    check-cast p2, Lcom/flyersoft/tools/T$FileItem;

    invoke-virtual {p0, p1, p2}, Lcom/flyersoft/moonreaderp/ActivityMain$LocalFilesComparable;->compare(Lcom/flyersoft/tools/T$FileItem;Lcom/flyersoft/tools/T$FileItem;)I

    move-result p1

    return p1
.end method
