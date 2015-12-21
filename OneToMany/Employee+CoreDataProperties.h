//
//  Employee+CoreDataProperties.h
//  OneToMany
//
//  Created by padalingam agasthian on 26/10/15.
//  Copyright © 2015 padalingam agasthian. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Employee.h"

NS_ASSUME_NONNULL_BEGIN

@interface Employee (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *employeeId;
@property (nullable, nonatomic, retain) NSString *employeeName;
@property (nullable, nonatomic, retain) NSString *designation;
@property (nullable, nonatomic, retain) NSSet<Employee *> *manager;
@property (nullable, nonatomic, retain) Employee *employee;

@end

@interface Employee (CoreDataGeneratedAccessors)

- (void)addManagerObject:(Employee *)value;
- (void)removeManagerObject:(Employee *)value;
- (void)addManager:(NSSet<Employee *> *)values;
- (void)removeManager:(NSSet<Employee *> *)values;

@end

NS_ASSUME_NONNULL_END
