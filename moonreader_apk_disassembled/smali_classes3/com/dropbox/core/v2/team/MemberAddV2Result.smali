.class public final Lcom/dropbox/core/v2/team/MemberAddV2Result;
.super Ljava/lang/Object;
.source "MemberAddV2Result.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/team/MemberAddV2Result$Serializer;,
        Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;
    }
.end annotation


# static fields
.field public static final OTHER:Lcom/dropbox/core/v2/team/MemberAddV2Result;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

.field private duplicateExternalMemberIdValue:Ljava/lang/String;

.field private duplicateMemberPersistentIdValue:Ljava/lang/String;

.field private freeTeamMemberLimitReachedValue:Ljava/lang/String;

.field private persistentIdDisabledValue:Ljava/lang/String;

.field private successValue:Lcom/dropbox/core/v2/team/TeamMemberInfoV2;

.field private teamLicenseLimitValue:Ljava/lang/String;

.field private userAlreadyOnTeamValue:Ljava/lang/String;

.field private userAlreadyPairedValue:Ljava/lang/String;

.field private userCreationFailedValue:Ljava/lang/String;

.field private userMigrationFailedValue:Ljava/lang/String;

.field private userOnAnotherTeamValue:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 111
    new-instance v0, Lcom/dropbox/core/v2/team/MemberAddV2Result;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MemberAddV2Result;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;->OTHER:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/team/MemberAddV2Result;->withTag(Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;)Lcom/dropbox/core/v2/team/MemberAddV2Result;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->OTHER:Lcom/dropbox/core/v2/team/MemberAddV2Result;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 129
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/team/MemberAddV2Result;)Ljava/lang/String;
    .locals 0

    .line 35
    iget-object p0, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->teamLicenseLimitValue:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/team/MemberAddV2Result;)Ljava/lang/String;
    .locals 0

    .line 35
    iget-object p0, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->freeTeamMemberLimitReachedValue:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$1000(Lcom/dropbox/core/v2/team/MemberAddV2Result;)Lcom/dropbox/core/v2/team/TeamMemberInfoV2;
    .locals 0

    .line 35
    iget-object p0, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->successValue:Lcom/dropbox/core/v2/team/TeamMemberInfoV2;

    return-object p0
.end method

.method static synthetic access$200(Lcom/dropbox/core/v2/team/MemberAddV2Result;)Ljava/lang/String;
    .locals 0

    .line 35
    iget-object p0, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->userAlreadyOnTeamValue:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$300(Lcom/dropbox/core/v2/team/MemberAddV2Result;)Ljava/lang/String;
    .locals 0

    .line 35
    iget-object p0, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->userOnAnotherTeamValue:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$400(Lcom/dropbox/core/v2/team/MemberAddV2Result;)Ljava/lang/String;
    .locals 0

    .line 35
    iget-object p0, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->userAlreadyPairedValue:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$500(Lcom/dropbox/core/v2/team/MemberAddV2Result;)Ljava/lang/String;
    .locals 0

    .line 35
    iget-object p0, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->userMigrationFailedValue:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$600(Lcom/dropbox/core/v2/team/MemberAddV2Result;)Ljava/lang/String;
    .locals 0

    .line 35
    iget-object p0, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->duplicateExternalMemberIdValue:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$700(Lcom/dropbox/core/v2/team/MemberAddV2Result;)Ljava/lang/String;
    .locals 0

    .line 35
    iget-object p0, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->duplicateMemberPersistentIdValue:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$800(Lcom/dropbox/core/v2/team/MemberAddV2Result;)Ljava/lang/String;
    .locals 0

    .line 35
    iget-object p0, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->persistentIdDisabledValue:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$900(Lcom/dropbox/core/v2/team/MemberAddV2Result;)Ljava/lang/String;
    .locals 0

    .line 35
    iget-object p0, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->userCreationFailedValue:Ljava/lang/String;

    return-object p0
.end method

.method public static duplicateExternalMemberId(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddV2Result;
    .locals 2

    if-eqz p0, :cond_2

    .line 808
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xff

    if-gt v0, v1, :cond_1

    .line 811
    const-string v0, "^[\'#&A-Za-z0-9._%+-]+@[A-Za-z0-9-][A-Za-z0-9.-]*\\.[A-Za-z]{2,15}$"

    invoke-static {v0, p0}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 814
    new-instance v0, Lcom/dropbox/core/v2/team/MemberAddV2Result;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MemberAddV2Result;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;->DUPLICATE_EXTERNAL_MEMBER_ID:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/MemberAddV2Result;->withTagAndDuplicateExternalMemberId(Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddV2Result;

    move-result-object p0

    return-object p0

    .line 812
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String does not match pattern"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 809
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String is longer than 255"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 806
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static duplicateMemberPersistentId(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddV2Result;
    .locals 2

    if-eqz p0, :cond_2

    .line 869
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xff

    if-gt v0, v1, :cond_1

    .line 872
    const-string v0, "^[\'#&A-Za-z0-9._%+-]+@[A-Za-z0-9-][A-Za-z0-9.-]*\\.[A-Za-z]{2,15}$"

    invoke-static {v0, p0}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 875
    new-instance v0, Lcom/dropbox/core/v2/team/MemberAddV2Result;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MemberAddV2Result;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;->DUPLICATE_MEMBER_PERSISTENT_ID:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/MemberAddV2Result;->withTagAndDuplicateMemberPersistentId(Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddV2Result;

    move-result-object p0

    return-object p0

    .line 873
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String does not match pattern"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 870
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String is longer than 255"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 867
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static freeTeamMemberLimitReached(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddV2Result;
    .locals 2

    if-eqz p0, :cond_2

    .line 506
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xff

    if-gt v0, v1, :cond_1

    .line 509
    const-string v0, "^[\'#&A-Za-z0-9._%+-]+@[A-Za-z0-9-][A-Za-z0-9.-]*\\.[A-Za-z]{2,15}$"

    invoke-static {v0, p0}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 512
    new-instance v0, Lcom/dropbox/core/v2/team/MemberAddV2Result;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MemberAddV2Result;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;->FREE_TEAM_MEMBER_LIMIT_REACHED:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/MemberAddV2Result;->withTagAndFreeTeamMemberLimitReached(Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddV2Result;

    move-result-object p0

    return-object p0

    .line 510
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String does not match pattern"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 507
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String is longer than 255"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 504
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static persistentIdDisabled(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddV2Result;
    .locals 2

    if-eqz p0, :cond_2

    .line 930
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xff

    if-gt v0, v1, :cond_1

    .line 933
    const-string v0, "^[\'#&A-Za-z0-9._%+-]+@[A-Za-z0-9-][A-Za-z0-9.-]*\\.[A-Za-z]{2,15}$"

    invoke-static {v0, p0}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 936
    new-instance v0, Lcom/dropbox/core/v2/team/MemberAddV2Result;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MemberAddV2Result;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;->PERSISTENT_ID_DISABLED:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/MemberAddV2Result;->withTagAndPersistentIdDisabled(Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddV2Result;

    move-result-object p0

    return-object p0

    .line 934
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String does not match pattern"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 931
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String is longer than 255"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 928
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static success(Lcom/dropbox/core/v2/team/TeamMemberInfoV2;)Lcom/dropbox/core/v2/team/MemberAddV2Result;
    .locals 2

    if-eqz p0, :cond_0

    .line 1046
    new-instance v0, Lcom/dropbox/core/v2/team/MemberAddV2Result;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MemberAddV2Result;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;->SUCCESS:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/MemberAddV2Result;->withTagAndSuccess(Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;Lcom/dropbox/core/v2/team/TeamMemberInfoV2;)Lcom/dropbox/core/v2/team/MemberAddV2Result;

    move-result-object p0

    return-object p0

    .line 1044
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static teamLicenseLimit(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddV2Result;
    .locals 2

    if-eqz p0, :cond_2

    .line 447
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xff

    if-gt v0, v1, :cond_1

    .line 450
    const-string v0, "^[\'#&A-Za-z0-9._%+-]+@[A-Za-z0-9-][A-Za-z0-9.-]*\\.[A-Za-z]{2,15}$"

    invoke-static {v0, p0}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 453
    new-instance v0, Lcom/dropbox/core/v2/team/MemberAddV2Result;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MemberAddV2Result;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;->TEAM_LICENSE_LIMIT:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/MemberAddV2Result;->withTagAndTeamLicenseLimit(Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddV2Result;

    move-result-object p0

    return-object p0

    .line 451
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String does not match pattern"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 448
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String is longer than 255"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 445
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static userAlreadyOnTeam(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddV2Result;
    .locals 2

    if-eqz p0, :cond_2

    .line 567
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xff

    if-gt v0, v1, :cond_1

    .line 570
    const-string v0, "^[\'#&A-Za-z0-9._%+-]+@[A-Za-z0-9-][A-Za-z0-9.-]*\\.[A-Za-z]{2,15}$"

    invoke-static {v0, p0}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 573
    new-instance v0, Lcom/dropbox/core/v2/team/MemberAddV2Result;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MemberAddV2Result;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;->USER_ALREADY_ON_TEAM:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/MemberAddV2Result;->withTagAndUserAlreadyOnTeam(Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddV2Result;

    move-result-object p0

    return-object p0

    .line 571
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String does not match pattern"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 568
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String is longer than 255"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 565
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static userAlreadyPaired(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddV2Result;
    .locals 2

    if-eqz p0, :cond_2

    .line 690
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xff

    if-gt v0, v1, :cond_1

    .line 693
    const-string v0, "^[\'#&A-Za-z0-9._%+-]+@[A-Za-z0-9-][A-Za-z0-9.-]*\\.[A-Za-z]{2,15}$"

    invoke-static {v0, p0}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 696
    new-instance v0, Lcom/dropbox/core/v2/team/MemberAddV2Result;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MemberAddV2Result;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;->USER_ALREADY_PAIRED:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/MemberAddV2Result;->withTagAndUserAlreadyPaired(Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddV2Result;

    move-result-object p0

    return-object p0

    .line 694
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String does not match pattern"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 691
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String is longer than 255"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 688
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static userCreationFailed(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddV2Result;
    .locals 2

    if-eqz p0, :cond_2

    .line 990
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xff

    if-gt v0, v1, :cond_1

    .line 993
    const-string v0, "^[\'#&A-Za-z0-9._%+-]+@[A-Za-z0-9-][A-Za-z0-9.-]*\\.[A-Za-z]{2,15}$"

    invoke-static {v0, p0}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 996
    new-instance v0, Lcom/dropbox/core/v2/team/MemberAddV2Result;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MemberAddV2Result;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;->USER_CREATION_FAILED:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/MemberAddV2Result;->withTagAndUserCreationFailed(Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddV2Result;

    move-result-object p0

    return-object p0

    .line 994
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String does not match pattern"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 991
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String is longer than 255"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 988
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static userMigrationFailed(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddV2Result;
    .locals 2

    if-eqz p0, :cond_2

    .line 748
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xff

    if-gt v0, v1, :cond_1

    .line 751
    const-string v0, "^[\'#&A-Za-z0-9._%+-]+@[A-Za-z0-9-][A-Za-z0-9.-]*\\.[A-Za-z]{2,15}$"

    invoke-static {v0, p0}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 754
    new-instance v0, Lcom/dropbox/core/v2/team/MemberAddV2Result;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MemberAddV2Result;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;->USER_MIGRATION_FAILED:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/MemberAddV2Result;->withTagAndUserMigrationFailed(Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddV2Result;

    move-result-object p0

    return-object p0

    .line 752
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String does not match pattern"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 749
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String is longer than 255"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 746
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static userOnAnotherTeam(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddV2Result;
    .locals 2

    if-eqz p0, :cond_2

    .line 630
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xff

    if-gt v0, v1, :cond_1

    .line 633
    const-string v0, "^[\'#&A-Za-z0-9._%+-]+@[A-Za-z0-9-][A-Za-z0-9.-]*\\.[A-Za-z]{2,15}$"

    invoke-static {v0, p0}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 636
    new-instance v0, Lcom/dropbox/core/v2/team/MemberAddV2Result;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MemberAddV2Result;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;->USER_ON_ANOTHER_TEAM:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/MemberAddV2Result;->withTagAndUserOnAnotherTeam(Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddV2Result;

    move-result-object p0

    return-object p0

    .line 634
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String does not match pattern"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 631
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String is longer than 255"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 628
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;)Lcom/dropbox/core/v2/team/MemberAddV2Result;
    .locals 1

    .line 142
    new-instance v0, Lcom/dropbox/core/v2/team/MemberAddV2Result;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MemberAddV2Result;-><init>()V

    .line 143
    iput-object p1, v0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->_tag:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    return-object v0
.end method

.method private withTagAndDuplicateExternalMemberId(Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddV2Result;
    .locals 1

    .line 302
    new-instance v0, Lcom/dropbox/core/v2/team/MemberAddV2Result;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MemberAddV2Result;-><init>()V

    .line 303
    iput-object p1, v0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->_tag:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    .line 304
    iput-object p2, v0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->duplicateExternalMemberIdValue:Ljava/lang/String;

    return-object v0
.end method

.method private withTagAndDuplicateMemberPersistentId(Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddV2Result;
    .locals 1

    .line 325
    new-instance v0, Lcom/dropbox/core/v2/team/MemberAddV2Result;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MemberAddV2Result;-><init>()V

    .line 326
    iput-object p1, v0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->_tag:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    .line 327
    iput-object p2, v0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->duplicateMemberPersistentIdValue:Ljava/lang/String;

    return-object v0
.end method

.method private withTagAndFreeTeamMemberLimitReached(Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddV2Result;
    .locals 1

    .line 187
    new-instance v0, Lcom/dropbox/core/v2/team/MemberAddV2Result;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MemberAddV2Result;-><init>()V

    .line 188
    iput-object p1, v0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->_tag:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    .line 189
    iput-object p2, v0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->freeTeamMemberLimitReachedValue:Ljava/lang/String;

    return-object v0
.end method

.method private withTagAndPersistentIdDisabled(Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddV2Result;
    .locals 1

    .line 349
    new-instance v0, Lcom/dropbox/core/v2/team/MemberAddV2Result;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MemberAddV2Result;-><init>()V

    .line 350
    iput-object p1, v0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->_tag:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    .line 351
    iput-object p2, v0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->persistentIdDisabledValue:Ljava/lang/String;

    return-object v0
.end method

.method private withTagAndSuccess(Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;Lcom/dropbox/core/v2/team/TeamMemberInfoV2;)Lcom/dropbox/core/v2/team/MemberAddV2Result;
    .locals 1

    .line 391
    new-instance v0, Lcom/dropbox/core/v2/team/MemberAddV2Result;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MemberAddV2Result;-><init>()V

    .line 392
    iput-object p1, v0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->_tag:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    .line 393
    iput-object p2, v0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->successValue:Lcom/dropbox/core/v2/team/TeamMemberInfoV2;

    return-object v0
.end method

.method private withTagAndTeamLicenseLimit(Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddV2Result;
    .locals 1

    .line 164
    new-instance v0, Lcom/dropbox/core/v2/team/MemberAddV2Result;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MemberAddV2Result;-><init>()V

    .line 165
    iput-object p1, v0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->_tag:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    .line 166
    iput-object p2, v0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->teamLicenseLimitValue:Ljava/lang/String;

    return-object v0
.end method

.method private withTagAndUserAlreadyOnTeam(Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddV2Result;
    .locals 1

    .line 211
    new-instance v0, Lcom/dropbox/core/v2/team/MemberAddV2Result;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MemberAddV2Result;-><init>()V

    .line 212
    iput-object p1, v0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->_tag:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    .line 213
    iput-object p2, v0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->userAlreadyOnTeamValue:Ljava/lang/String;

    return-object v0
.end method

.method private withTagAndUserAlreadyPaired(Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddV2Result;
    .locals 1

    .line 257
    new-instance v0, Lcom/dropbox/core/v2/team/MemberAddV2Result;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MemberAddV2Result;-><init>()V

    .line 258
    iput-object p1, v0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->_tag:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    .line 259
    iput-object p2, v0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->userAlreadyPairedValue:Ljava/lang/String;

    return-object v0
.end method

.method private withTagAndUserCreationFailed(Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddV2Result;
    .locals 1

    .line 371
    new-instance v0, Lcom/dropbox/core/v2/team/MemberAddV2Result;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MemberAddV2Result;-><init>()V

    .line 372
    iput-object p1, v0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->_tag:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    .line 373
    iput-object p2, v0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->userCreationFailedValue:Ljava/lang/String;

    return-object v0
.end method

.method private withTagAndUserMigrationFailed(Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddV2Result;
    .locals 1

    .line 279
    new-instance v0, Lcom/dropbox/core/v2/team/MemberAddV2Result;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MemberAddV2Result;-><init>()V

    .line 280
    iput-object p1, v0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->_tag:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    .line 281
    iput-object p2, v0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->userMigrationFailedValue:Ljava/lang/String;

    return-object v0
.end method

.method private withTagAndUserOnAnotherTeam(Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddV2Result;
    .locals 1

    .line 235
    new-instance v0, Lcom/dropbox/core/v2/team/MemberAddV2Result;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MemberAddV2Result;-><init>()V

    .line 236
    iput-object p1, v0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->_tag:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    .line 237
    iput-object p2, v0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->userOnAnotherTeamValue:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-nez p1, :cond_1

    return v1

    .line 1105
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/team/MemberAddV2Result;

    if-eqz v2, :cond_19

    .line 1106
    check-cast p1, Lcom/dropbox/core/v2/team/MemberAddV2Result;

    .line 1107
    iget-object v2, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->_tag:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/team/MemberAddV2Result;->_tag:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 1110
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/team/MemberAddV2Result$1;->$SwitchMap$com$dropbox$core$v2$team$MemberAddV2Result$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->_tag:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    return v1

    :pswitch_0
    return v0

    .line 1132
    :pswitch_1
    iget-object v2, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->successValue:Lcom/dropbox/core/v2/team/TeamMemberInfoV2;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/MemberAddV2Result;->successValue:Lcom/dropbox/core/v2/team/TeamMemberInfoV2;

    if-eq v2, p1, :cond_4

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/team/TeamMemberInfoV2;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    goto :goto_0

    :cond_3
    return v1

    :cond_4
    :goto_0
    return v0

    .line 1130
    :pswitch_2
    iget-object v2, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->userCreationFailedValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/MemberAddV2Result;->userCreationFailedValue:Ljava/lang/String;

    if-eq v2, p1, :cond_6

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_1

    :cond_5
    return v1

    :cond_6
    :goto_1
    return v0

    .line 1128
    :pswitch_3
    iget-object v2, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->persistentIdDisabledValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/MemberAddV2Result;->persistentIdDisabledValue:Ljava/lang/String;

    if-eq v2, p1, :cond_8

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_7

    goto :goto_2

    :cond_7
    return v1

    :cond_8
    :goto_2
    return v0

    .line 1126
    :pswitch_4
    iget-object v2, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->duplicateMemberPersistentIdValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/MemberAddV2Result;->duplicateMemberPersistentIdValue:Ljava/lang/String;

    if-eq v2, p1, :cond_a

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_9

    goto :goto_3

    :cond_9
    return v1

    :cond_a
    :goto_3
    return v0

    .line 1124
    :pswitch_5
    iget-object v2, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->duplicateExternalMemberIdValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/MemberAddV2Result;->duplicateExternalMemberIdValue:Ljava/lang/String;

    if-eq v2, p1, :cond_c

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_b

    goto :goto_4

    :cond_b
    return v1

    :cond_c
    :goto_4
    return v0

    .line 1122
    :pswitch_6
    iget-object v2, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->userMigrationFailedValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/MemberAddV2Result;->userMigrationFailedValue:Ljava/lang/String;

    if-eq v2, p1, :cond_e

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_d

    goto :goto_5

    :cond_d
    return v1

    :cond_e
    :goto_5
    return v0

    .line 1120
    :pswitch_7
    iget-object v2, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->userAlreadyPairedValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/MemberAddV2Result;->userAlreadyPairedValue:Ljava/lang/String;

    if-eq v2, p1, :cond_10

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_f

    goto :goto_6

    :cond_f
    return v1

    :cond_10
    :goto_6
    return v0

    .line 1118
    :pswitch_8
    iget-object v2, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->userOnAnotherTeamValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/MemberAddV2Result;->userOnAnotherTeamValue:Ljava/lang/String;

    if-eq v2, p1, :cond_12

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_11

    goto :goto_7

    :cond_11
    return v1

    :cond_12
    :goto_7
    return v0

    .line 1116
    :pswitch_9
    iget-object v2, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->userAlreadyOnTeamValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/MemberAddV2Result;->userAlreadyOnTeamValue:Ljava/lang/String;

    if-eq v2, p1, :cond_14

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_13

    goto :goto_8

    :cond_13
    return v1

    :cond_14
    :goto_8
    return v0

    .line 1114
    :pswitch_a
    iget-object v2, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->freeTeamMemberLimitReachedValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/MemberAddV2Result;->freeTeamMemberLimitReachedValue:Ljava/lang/String;

    if-eq v2, p1, :cond_16

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_15

    goto :goto_9

    :cond_15
    return v1

    :cond_16
    :goto_9
    return v0

    .line 1112
    :pswitch_b
    iget-object v2, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->teamLicenseLimitValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/MemberAddV2Result;->teamLicenseLimitValue:Ljava/lang/String;

    if-eq v2, p1, :cond_18

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_17

    goto :goto_a

    :cond_17
    return v1

    :cond_18
    :goto_a
    return v0

    :cond_19
    return v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getDuplicateExternalMemberIdValue()Ljava/lang/String;
    .locals 3

    .line 831
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->_tag:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;->DUPLICATE_EXTERNAL_MEMBER_ID:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    if-ne v0, v1, :cond_0

    .line 834
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->duplicateExternalMemberIdValue:Ljava/lang/String;

    return-object v0

    .line 832
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.DUPLICATE_EXTERNAL_MEMBER_ID, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->_tag:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getDuplicateMemberPersistentIdValue()Ljava/lang/String;
    .locals 3

    .line 892
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->_tag:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;->DUPLICATE_MEMBER_PERSISTENT_ID:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    if-ne v0, v1, :cond_0

    .line 895
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->duplicateMemberPersistentIdValue:Ljava/lang/String;

    return-object v0

    .line 893
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.DUPLICATE_MEMBER_PERSISTENT_ID, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->_tag:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getFreeTeamMemberLimitReachedValue()Ljava/lang/String;
    .locals 3

    .line 528
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->_tag:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;->FREE_TEAM_MEMBER_LIMIT_REACHED:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    if-ne v0, v1, :cond_0

    .line 531
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->freeTeamMemberLimitReachedValue:Ljava/lang/String;

    return-object v0

    .line 529
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.FREE_TEAM_MEMBER_LIMIT_REACHED, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->_tag:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getPersistentIdDisabledValue()Ljava/lang/String;
    .locals 3

    .line 953
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->_tag:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;->PERSISTENT_ID_DISABLED:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    if-ne v0, v1, :cond_0

    .line 956
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->persistentIdDisabledValue:Ljava/lang/String;

    return-object v0

    .line 954
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.PERSISTENT_ID_DISABLED, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->_tag:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getSuccessValue()Lcom/dropbox/core/v2/team/TeamMemberInfoV2;
    .locals 3

    .line 1060
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->_tag:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;->SUCCESS:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    if-ne v0, v1, :cond_0

    .line 1063
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->successValue:Lcom/dropbox/core/v2/team/TeamMemberInfoV2;

    return-object v0

    .line 1061
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.SUCCESS, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->_tag:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getTeamLicenseLimitValue()Ljava/lang/String;
    .locals 3

    .line 468
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->_tag:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;->TEAM_LICENSE_LIMIT:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    if-ne v0, v1, :cond_0

    .line 471
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->teamLicenseLimitValue:Ljava/lang/String;

    return-object v0

    .line 469
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.TEAM_LICENSE_LIMIT, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->_tag:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getUserAlreadyOnTeamValue()Ljava/lang/String;
    .locals 3

    .line 591
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->_tag:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;->USER_ALREADY_ON_TEAM:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    if-ne v0, v1, :cond_0

    .line 594
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->userAlreadyOnTeamValue:Ljava/lang/String;

    return-object v0

    .line 592
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.USER_ALREADY_ON_TEAM, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->_tag:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getUserAlreadyPairedValue()Ljava/lang/String;
    .locals 3

    .line 711
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->_tag:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;->USER_ALREADY_PAIRED:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    if-ne v0, v1, :cond_0

    .line 714
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->userAlreadyPairedValue:Ljava/lang/String;

    return-object v0

    .line 712
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.USER_ALREADY_PAIRED, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->_tag:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getUserCreationFailedValue()Ljava/lang/String;
    .locals 3

    .line 1012
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->_tag:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;->USER_CREATION_FAILED:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    if-ne v0, v1, :cond_0

    .line 1015
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->userCreationFailedValue:Ljava/lang/String;

    return-object v0

    .line 1013
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.USER_CREATION_FAILED, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->_tag:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getUserMigrationFailedValue()Ljava/lang/String;
    .locals 3

    .line 770
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->_tag:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;->USER_MIGRATION_FAILED:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    if-ne v0, v1, :cond_0

    .line 773
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->userMigrationFailedValue:Ljava/lang/String;

    return-object v0

    .line 771
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.USER_MIGRATION_FAILED, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->_tag:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getUserOnAnotherTeamValue()Ljava/lang/String;
    .locals 3

    .line 653
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->_tag:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;->USER_ON_ANOTHER_TEAM:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    if-ne v0, v1, :cond_0

    .line 656
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->userOnAnotherTeamValue:Ljava/lang/String;

    return-object v0

    .line 654
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.USER_ON_ANOTHER_TEAM, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->_tag:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 14

    .line 1079
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->_tag:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->teamLicenseLimitValue:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->freeTeamMemberLimitReachedValue:Ljava/lang/String;

    iget-object v3, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->userAlreadyOnTeamValue:Ljava/lang/String;

    iget-object v4, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->userOnAnotherTeamValue:Ljava/lang/String;

    iget-object v5, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->userAlreadyPairedValue:Ljava/lang/String;

    iget-object v6, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->userMigrationFailedValue:Ljava/lang/String;

    iget-object v7, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->duplicateExternalMemberIdValue:Ljava/lang/String;

    iget-object v8, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->duplicateMemberPersistentIdValue:Ljava/lang/String;

    iget-object v9, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->persistentIdDisabledValue:Ljava/lang/String;

    iget-object v10, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->userCreationFailedValue:Ljava/lang/String;

    iget-object v11, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->successValue:Lcom/dropbox/core/v2/team/TeamMemberInfoV2;

    const/16 v12, 0xc

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    aput-object v0, v12, v13

    const/4 v0, 0x1

    aput-object v1, v12, v0

    const/4 v0, 0x2

    aput-object v2, v12, v0

    const/4 v0, 0x3

    aput-object v3, v12, v0

    const/4 v0, 0x4

    aput-object v4, v12, v0

    const/4 v0, 0x5

    aput-object v5, v12, v0

    const/4 v0, 0x6

    aput-object v6, v12, v0

    const/4 v0, 0x7

    aput-object v7, v12, v0

    const/16 v0, 0x8

    aput-object v8, v12, v0

    const/16 v0, 0x9

    aput-object v9, v12, v0

    const/16 v0, 0xa

    aput-object v10, v12, v0

    const/16 v0, 0xb

    aput-object v11, v12, v0

    invoke-static {v12}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    .line 1093
    invoke-super {p0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    mul-int/lit8 v1, v1, 0x1f

    add-int/2addr v1, v0

    return v1
.end method

.method public isDuplicateExternalMemberId()Z
    .locals 2

    .line 784
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->_tag:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;->DUPLICATE_EXTERNAL_MEMBER_ID:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isDuplicateMemberPersistentId()Z
    .locals 2

    .line 845
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->_tag:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;->DUPLICATE_MEMBER_PERSISTENT_ID:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isFreeTeamMemberLimitReached()Z
    .locals 2

    .line 482
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->_tag:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;->FREE_TEAM_MEMBER_LIMIT_REACHED:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 1074
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->_tag:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;->OTHER:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isPersistentIdDisabled()Z
    .locals 2

    .line 906
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->_tag:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;->PERSISTENT_ID_DISABLED:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isSuccess()Z
    .locals 2

    .line 1026
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->_tag:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;->SUCCESS:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isTeamLicenseLimit()Z
    .locals 2

    .line 423
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->_tag:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;->TEAM_LICENSE_LIMIT:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isUserAlreadyOnTeam()Z
    .locals 2

    .line 542
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->_tag:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;->USER_ALREADY_ON_TEAM:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isUserAlreadyPaired()Z
    .locals 2

    .line 667
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->_tag:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;->USER_ALREADY_PAIRED:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isUserCreationFailed()Z
    .locals 2

    .line 967
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->_tag:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;->USER_CREATION_FAILED:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isUserMigrationFailed()Z
    .locals 2

    .line 725
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->_tag:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;->USER_MIGRATION_FAILED:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isUserOnAnotherTeam()Z
    .locals 2

    .line 605
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->_tag:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;->USER_ON_ANOTHER_TEAM:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;
    .locals 1

    .line 412
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddV2Result;->_tag:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1146
    sget-object v0, Lcom/dropbox/core/v2/team/MemberAddV2Result$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/MemberAddV2Result$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/MemberAddV2Result$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 1158
    sget-object v0, Lcom/dropbox/core/v2/team/MemberAddV2Result$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/MemberAddV2Result$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/MemberAddV2Result$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
